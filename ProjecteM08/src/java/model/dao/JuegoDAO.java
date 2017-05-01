/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import model.Juego;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Narref
 */
public class JuegoDAO {
    
    public boolean grabarJuego(Juego juego){
        boolean inserted = true;

        try{
            Session session = HibernateUtil.getSession();
            Transaction trans = session.beginTransaction();
            
            session.saveOrUpdate(juego);
            session.flush();
        }catch(Exception e){
            e.printStackTrace();
            inserted = false;
        }
        
        return inserted;
    }
    
    public Juego getJuego(Juego juego){
        Session session = HibernateUtil.getSession();
        try {
            juego =  (Juego) session.get(Juego.class, juego.getIdjuego());
        } catch (Exception e) {}
        
        return juego;
    }
    
    public List<Juego> getAllJuegos(){
        Session session = HibernateUtil.getSession();
        Query query = session.createQuery("from Juego");
        List<Juego> list = query.list();
        session.close();
        
        return list;
    }
    
    public void eliminarJuego(Juego j){
        Session session = HibernateUtil.getSession();
        session.delete(j);
    }
    
    
}
