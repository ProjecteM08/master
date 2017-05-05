/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import model.Juego;
import model.Usuari;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Narref
 */
public class UsuariDAO {

    /**
     *  Metodo para grabar usuarios en la base de datos (tabla usuaris)
     * @param usuari Usuario a grabar
     * @return Boolean si se ha grabado o no
     */
    public boolean grabarUsuari(Usuari usuari){
        boolean inserted = true;
        Session session = HibernateUtil.getSession();
        Transaction trans = session.beginTransaction();
        try{
            session.saveOrUpdate(usuari);
            session.flush();
            trans.commit();
        }catch(Exception e){
            e.printStackTrace();
            inserted = false;
            trans.rollback();
        }
        
        return inserted;
    }

    /**
     * Obtener un usuario de la base de datos
     * @param usuari Usuari que queremos obtener
     * @return Le pasamos un objeto usuario vacio con la id del usuario a obtener)
     */
    public Usuari getUsuari(Usuari usuari) {
        Session session = HibernateUtil.getSession();
        try {
            usuari = (Usuari) session.get(Usuari.class, usuari.getIdusuaris());
        } catch (Exception e) {
        }

        return usuari;
    }

    /**
     * Obtener todos los usuarios de la tabla
     * @return Lista Usuaris
     */
    public List<Usuari> getAllUsuaris() {
        Session session = HibernateUtil.getSession();
        Query query = session.createQuery("from Usuari");
        List<Usuari> list = query.list();
        session.close();

        return list;
    }

    /**
     * Eliminar un usuario de la tabla
     * @param usuari el usuario con la id informada (primero tenemos que cogerlo utilizando el metodo getUsuari)
     */
    public void eliminarUsuari(Usuari usuari) {
        Session session = HibernateUtil.getSession();
        Transaction trans = session.beginTransaction();
        try{
            session.delete(usuari);
            trans.commit();
        }catch(Exception e){
            e.printStackTrace();
            trans.rollback();
        }
    }

}
