package headtrackdbConnect;

import java.time.LocalDateTime;

public class Prix {
    private double montant;
    private LocalDateTime dateRelevee;
    private String vendeur;

    public Prix(double montant, LocalDateTime dateRelevee, String vendeur) {
        this.montant = montant;
        this.dateRelevee = dateRelevee;
        this.vendeur = vendeur;
    }

    @Override
    public String toString() {
        return vendeur + ": " + montant + " € (" + dateRelevee.toString() + ")";
    }

    public double getMontant() { return montant; }
}
