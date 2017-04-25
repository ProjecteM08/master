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
public class Juego implements Serializable {

    private int idjuego;
    private String nom;
    private double precio;
    private String url;


    public Juego(String nom, double precio, String url) {
this.nom=nom;
this.precio=precio;
this.url=url;
    }

    public Juego() {

    }

    public int getIdjuego() {
        return idjuego;
    }

    public void setIdjuego(int idjuego) {
        this.idjuego = idjuego;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "Juego{" + "idjuego=" + idjuego + ", nom=" + nom + ", precio=" + precio + ", url=" + url + '}';
    }

   
}

