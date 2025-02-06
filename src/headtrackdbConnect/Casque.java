package headtrackdbConnect;

public class Casque {
    private int id;
    private String nom;
    private String marque;
    private String type;
    private int autonomie; // En heures
    private boolean anc; // Réduction active du bruit
    private double noteGlobale; // Note moyenne
    private String connectique;

    public Casque(int id, String nom, String marque, String type, int autonomie, boolean anc, double noteGlobale, String connectique) {
        this.id = id;
        this.nom = nom;
        this.marque = marque;
        this.type = type;
        this.autonomie = autonomie;
        this.anc = anc;
        this.noteGlobale = noteGlobale;
        this.connectique = connectique;
    }

    public int getId() { return id; }
    public String getNom() { return nom; }
    public double getNoteGlobale() { return noteGlobale; }
    public int getAutonomie() { return autonomie; }

    @Override
    public String toString() {
        return "\n--- Casque ---" +
               "\nNom : " + nom +
               "\nMarque : " + marque +
               "\nType : " + type +
               "\nAutonomie : " + autonomie + " heures" +
               "\nANC : " + (anc ? "Oui" : "Non") +
               "\nNote Globale : " + noteGlobale +
               "\nConnectique : " + connectique;
    }
}
