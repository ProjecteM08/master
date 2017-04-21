package model;

/**
 *
 * @author montse
 */
import java.io.Serializable;

/**
 *
 * @author montse
 * @version abril 2017
 */
public class Usuari implements Serializable {

    private int idusuaris;
    private String password;
    private String nom;
    private double dinero;
    private String admin;

    public Usuari(String password, String n) {
        this.password = password;
        this.nom=n;
        this.admin="F";
        this.dinero=100;
    }

    public Usuari() {

    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public int getIdusuaris() {
        return idusuaris;
    }

    public void setIdusuaris(int idusuaris) {
        this.idusuaris = idusuaris;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public double getDinero() {
        return dinero;
    }

    public void setDinero(double dinero) {
        this.dinero = dinero;
    }

    public String getAdmin() {
        return admin;
    }

    public void setAdmin(String admin) {
        this.admin = admin;
    }

 

    //sense el password
    @Override
    public String toString() {
        return "Usuari{" + "id=" + idusuaris + ", nom=" + nom + ", password="+password+'}';
        
    }
}

