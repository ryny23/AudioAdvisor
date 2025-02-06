package headtrackdbConnect;

import java.time.LocalDateTime;

public class Avis {
    private String utilisateur;
    private double note;
    private String commentaire;
    private LocalDateTime dateAvis;

    public Avis(String utilisateur, double note, String commentaire, LocalDateTime dateAvis) {
        this.utilisateur = utilisateur;
        this.note = note;
        this.commentaire = commentaire;
        this.dateAvis = dateAvis;
    }

    @Override
    public String toString() {
        return utilisateur + ": " + note + "/5\n\"" + commentaire + "\" (" + dateAvis.toString() + ")";
    }
}
