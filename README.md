# AudioAdvisor 🎧
L'application qui te sert de conseiller pour choisir le meilleur casque.


AudioAdvisor est une application Java qui permet de suivre et comparer les performances, prix, et avis des casques audio haut de gamme.
Ce projet met en œuvre des compétences clés en développement backend, gestion de bases de données, et manipulation de données pour répondre à des problématiques actuelles.

---

📌 Objectifs du Projet

- Suivre l'évolution des prix des casques audio sur différents sites marchands.
- Comparer les casques selon des critères clés (qualité audio, ANC, gaming, autonomie…).
- Offrir une interface simple pour afficher les résultats.
- Démontrer une maîtrise des technologies Java et MySQL.

---

⚙️ Fonctionnalités

1. Base de Données MySQL :
   - Tables pour les casques, vendeurs, prix historiques et avis clients.
   - Relations bien définies entre les entités.

2. Application Java :
   - Connexion à la base de données via JDBC.
   - Récupération des données avec gestion robuste des erreurs.
   - Affichage interactif en console :
     - Liste complète des casques avec leurs détails.
     - Comparaison des meilleurs casques par critères (prix, autonomie, note globale).

3. Documentation Professionnelle :
   - Explications claires sur l'installation, l'exécution et les fonctionnalités.

---

🛠️ Technologies Utilisées

- **Java** : Développement backend.
- **MySQL** : Base de données relationnelle.
- **JDBC** : Connexion entre Java et MySQL.
- **Navicat / XAMPP** : Gestion de la base de données MySQL.

---

📋 Installation

Prérequis

- [Java 17+](https://www.oracle.com/java/technologies/javase-downloads.html)
- [MySQL](https://dev.mysql.com/downloads/) ou [MariaDB](https://mariadb.org/)
- [Navicat](https://www.navicat.com/en/) ou [phpMyAdmin](https://www.phpmyadmin.net/)
- [Eclipse IDE](https://www.eclipse.org/downloads/) ou tout autre IDE compatible avec Java.

Étapes

1. Clonez ce dépôt GitHub :

git clone https://github.com/votre-utilisateur/headtrack.git
cd headtrack


2. Importez le script SQL dans votre base MySQL :
- Ouvrez votre outil MySQL (phpMyAdmin, Navicat...).
- Exécutez le script `sql/headtrack_db.sql`.

3. Configurez la connexion à la base dans `DatabaseConnection.java` :

private static final String URL = "jdbc:mysql://localhost:3306/headtrack_db";
private static final String USER = "root"; // Remplacez par votre utilisateur MySQL
private static final String PASSWORD = ""; // Remplacez par votre mot de passe MySQL



4. Compilez et exécutez le projet dans votre IDE.

---

🚀 Utilisation

Menu Principal

Lorsque vous exécutez l'application, vous accédez au menu suivant :


--- Menu ---1 Afficher toutes les informations par casque2 Voir le meilleur casque par critères (prix, autonomie, note globale) Quitter
Entrez votre choix :



Exemple d'Affichage

Option 1 : Afficher toutes les informations par casque

--- Casque ---
Nom : Sony WH-1000XM5
Marque : Sony
Type : Over-ear
Autonomie : 30 heures
ANC : Oui
Note Globale : 4.8/5
Connectique : Bluetooth, Jack 3.5mm, USB-C
Prix disponibles :
Amazon: 349.99 € (2024-02-01)
Fnac: 359.00 € (2024-02-01)
Avis des utilisateurs :
XxDarkAngel92xX: 5.0/5 "Incroyable qualité sonore et ANC très performant." (2023-08-12)



Option 2 : Voir le meilleur casque par critères

--- Meilleurs Casques par Critères ---
Meilleur Prix : Sony WH-1000


