package headtrackdbConnect;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.*;

public class DatabaseConnection {

    private static final String URL = "jdbc:mysql://localhost:3306/headtrack_db";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    // Méthode pour établir la connexion à la base de données
    public static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("Erreur de connexion à la base de données.");
            e.printStackTrace();
        }
        return connection;
    }

    // Méthode pour récupérer tous les casques
    public static List<Casque> getAllCasques() {
        List<Casque> casques = new ArrayList<>();
        String query = "SELECT * FROM casques";
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {

            while (resultSet.next()) {
                Casque casque = new Casque(
                        resultSet.getInt("id_casque"),
                        resultSet.getString("nom"),
                        resultSet.getString("marque"),
                        resultSet.getString("type"),
                        resultSet.getInt("autonomie"),
                        resultSet.getBoolean("ANC"),
                        resultSet.getDouble("note_globale"),
                        resultSet.getString("connectique")
                );
                casques.add(casque);
            }
        } catch (SQLException e) {
            System.out.println("Erreur lors de la récupération des casques.");
            e.printStackTrace();
        }
        return casques;
    }

    // Méthode pour récupérer les prix d'un casque
    public static List<Prix> getPrixByCasque(int idCasque) {
        List<Prix> prixList = new ArrayList<>();
        String query = "SELECT p.prix, p.date_releve, v.nom AS vendeur FROM prix p " +
                       "JOIN vendeurs v ON p.id_vendeur = v.id_vendeur WHERE p.id_casque = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setInt(1, idCasque);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Prix prix = new Prix(
                        resultSet.getDouble("prix"),
                        resultSet.getTimestamp("date_releve").toLocalDateTime(),
                        resultSet.getString("vendeur")
                );
                prixList.add(prix);
            }
        } catch (SQLException e) {
            System.out.println("Erreur lors de la récupération des prix.");
            e.printStackTrace();
        }
        return prixList;
    }

    // Méthode principale avec menu interactif
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        while (true) {
            System.out.println("\n--- Menu ---");
            System.out.println("[1] Afficher toutes les informations par casque");
            System.out.println("[2] Voir le meilleur casque par critères");
            System.out.println("[0] Quitter");

            System.out.print("\nEntrez votre choix : ");
            int choix = scanner.nextInt();

            switch (choix) {
                case 1:
                    afficherInformationsParCasque();
                    break;

                case 2:
                    afficherMeilleurCasqueParCritere();
                    break;

                case 0:
                    System.out.println("\nAu revoir !");
                    scanner.close();
                    return;

                default:
                    System.out.println("\nChoix invalide. Veuillez réessayer.");
                    break;
            }
        }
    }

    // Méthode pour afficher toutes les informations par casque
    public static void afficherInformationsParCasque() {
        List<Casque> casques = getAllCasques();

        for (Casque casque : casques) {
            System.out.println(casque);

            // Affichage des prix
            List<Prix> prixList = getPrixByCasque(casque.getId());
            if (!prixList.isEmpty()) {
                System.out.println("\n  Prix disponibles :");
                for (Prix prix : prixList) {
                    System.out.println("  - " + prix);
                }
            } else {
                System.out.println("\n  Aucun prix disponible.");
            }
        }
    }

    // Méthode pour afficher le meilleur casque par critères
    private static void afficherMeilleurCasqueParCritere() {
        List<Casque> casques = getAllCasques();

        // Meilleur par prix
        Casque meilleurPrix =
                casques.stream().min(Comparator.comparingDouble(c -> getPrixByCasque(c.getId()).stream()
                        .mapToDouble(Prix::getMontant).min().orElse(Double.MAX_VALUE))).orElse(null);

        // Meilleur par autonomie
        Casque meilleureAutonomie =
                casques.stream().max(Comparator.comparingInt(Casque::getAutonomie)).orElse(null);

        // Meilleur par note globale
        Casque meilleureNote =
                casques.stream().max(Comparator.comparingDouble(Casque::getNoteGlobale)).orElse(null);

        System.out.println("\n--- Meilleurs Casques par Critères ---");

        if (meilleurPrix != null) {
            double meilleurPrixValeur = getPrixByCasque(meilleurPrix.getId()).stream()
                    .mapToDouble(Prix::getMontant).min().orElse(Double.MAX_VALUE);
            System.out.printf("* Meilleur Prix : %s - %.2f €\n", meilleurPrix.getNom(), meilleurPrixValeur);
        }

        if (meilleureAutonomie != null) {
            System.out.printf("* Meilleure Autonomie : %s - %d heures\n",
                    meilleureAutonomie.getNom(), meilleureAutonomie.getAutonomie());
        }

        if (meilleureNote != null) {
            System.out.printf("* Meilleure Note Globale : %s - %.1f/5\n",
                    meilleureNote.getNom(), meilleureNote.getNoteGlobale());
        }
    }
}
