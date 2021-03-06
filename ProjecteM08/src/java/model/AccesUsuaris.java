package model;

import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

/**
 * Classe que gestiona la connexió a un SGBDR MySQL La taula on es guarden les
 * dades es diu t_usuaris i les columnes id varchar(20(), password varchar(100),
 * nom varchar(45) Utilizo una funció per encriptar els passwords
 *
 * @author montse
 * @version abril 2017
 */
public class AccesUsuaris {

    private Connection con;
    private Statement sentencia;

    public AccesUsuaris() throws Exception {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setUser("root");
        dataSource.setPassword("");
        // dataSource.setServerName("elnomdelserver.org");
        dataSource.setDatabaseName("m8");
        con = dataSource.getConnection();
        sentencia = con.createStatement();
    }
//    public AccesUsuaris() throws Exception {
//
//        Class.forName("com.mysql.jdbc.Driver"); 
//        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bd_proves?useUnicode=yes&characterEncoding=UTF-8", "root", "1234");
//        sentencia = con.createStatement();
//    }

    //retorna el nom de l'usuari valid
    public Usuari validarUsuari(Usuari u) throws UsuariInexistentException, PasswordIncorrecteException, SQLException {
        //filtrar getNom() d'entrada "maliciosa"        
        String text = "select * from usuaris where nom='" + u.getNom() + "'";
        ResultSet res = sentencia.executeQuery(text);
//        String p2 = getEncryptedPassword(u.getPassword());

        if (res.next()) {
            /* si hi ha un registre*/
 /* si coincideix la clau*/

            if (!res.getString("password").equals(u.getPassword())) {
                throw new PasswordIncorrecteException();
            } else {
                Usuari user = new Usuari();
                user.setAdmin(res.getString("admin"));
                user.setDinero(res.getDouble("dinero"));
                user.setIdusuaris(res.getInt("idusuaris"));
                user.setNom(res.getString("nom"));
                user.setPassword(res.getString("password"));

                return user;
            }
        } else {
            throw new UsuariInexistentException();
            /* no hi ha registre, per tant, no hi ha usuari*/

        }
    }

    /**
     *
     */
    public ResultSet GetJuegos() throws SQLException {

        String text = "select * from juegos";
        ResultSet res = sentencia.executeQuery(text);
        return res;

    }

    public Juego GetJuego(String p) throws SQLException{
     String text = "select * from juegos where idjuego='" + p + "'";
        ResultSet res = sentencia.executeQuery(text);

        if (res.next()) {
            /* si hi ha un registre*/
 /* si coincideix la clau*/
            Juego joc = new Juego();
            
            joc.setNom(res.getString("nom"));
            joc.setPrecio(res.getDouble("precio"));
            joc.setUrl(res.getString("url"));
           

            return joc;
        }
        return null;
    
    
    
    }
    
    
    public Usuari getUser(String p) throws SQLException {
        String text = "select * from usuaris where idusuaris='" + p + "'";
        ResultSet res = sentencia.executeQuery(text);

        if (res.next()) {
            /* si hi ha un registre*/
 /* si coincideix la clau*/
            Usuari user = new Usuari();
            user.setAdmin(res.getString("admin"));
            user.setDinero(res.getDouble("dinero"));
            user.setIdusuaris(res.getInt("idusuaris"));
            user.setNom(res.getString("nom"));
            user.setPassword(res.getString("password"));

            return user;
        }
        return null;
    }

    /* donar d'alta un nou usuari*/
    public void registrarUsuari(Usuari u) throws UsuariRepetitException {
        try {
//            String p2 = getEncryptedPassword(u.getPassword());
            String text = "insert into usuaris(password, nom, admin, dinero) values ('" + u.getPassword() + "','" + u.getNom() + "','" + u.getAdmin() + "','" + u.getDinero() + "')";
            sentencia.executeUpdate(text);
        } catch (SQLException e) {
            System.out.println(e);
            throw new UsuariRepetitException();
        }
    }

    /**
     * Encrypt password by using SHA-256 algorithm, encryptedPassword length is
     * 32 bits
     *
     * @param clearTextPassword
     * @return
     * @throws NoSuchAlgorithmException reference
     * http://java.sun.com/j2se/1.4.2/docs/api/java/security/MessageDigest.html
     * @version per java 8 ja existeix java.util.Base64
     */
    public static String getEncryptedPassword(String clearTextPassword) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(clearTextPassword.getBytes());
            //aquesta funció s'ha de canviar per un Base64 oficial de java.util.Base64
            return new sun.misc.BASE64Encoder().encode(md.digest());
        } catch (NoSuchAlgorithmException e) {
            //_log.error("Failed to encrypt password.", e);
        }
        return "";
    }
}
