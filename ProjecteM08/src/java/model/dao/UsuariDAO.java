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

    public Usuari getUsuari(Usuari usuari) {
        Session session = HibernateUtil.getSession();
        try {
            usuari = (Usuari) session.get(Usuari.class, usuari.getIdusuaris());
        } catch (Exception e) {
        }

        return usuari;
    }

    public List<Usuari> getAllUsuaris() {
        Session session = HibernateUtil.getSession();
        Query query = session.createQuery("from Usuari");
        List<Usuari> list = query.list();
        session.close();

        return list;
    }

    public void eliminarUsuari(Usuari usuari) {
        Session session = HibernateUtil.getSession();
        session.delete(usuari);
    }

}
