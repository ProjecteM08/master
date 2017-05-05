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
    
    /**
     *  Metodo para grabar videojuegos en la base de datos (tabla juegos)
     * @param juego Juego que queremos grabar en la bd
     * @return Boolean si se ha grabado o no
     */
    public boolean grabarJuego(Juego juego){
        boolean inserted = true;
        Session session = HibernateUtil.getSession();
        Transaction trans = session.beginTransaction();
        try{
            session.saveOrUpdate(juego);
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
     *  Obtener un juego de la base de datos 
     * @param juego Le pasamos un objeto juego vacio con la id del juego a obtener
     * @return Retornamos el juego de la base de datos
     */
    public Juego getJuego(Juego juego){
        Session session = HibernateUtil.getSession();
        try {
            juego =  (Juego) session.get(Juego.class, juego.getIdjuego());
        } catch (Exception e) {}
        
        return juego;
    }
    
    /**
     *  Obtener todos los juegos de la tabla
     * @return Lista de juegos
     */
    public List<Juego> getAllJuegos(){
        Session session = HibernateUtil.getSession();
        Query query = session.createQuery("from Juego");
        List<Juego> list = query.list();
        session.close();
        
        return list;
    }
    
    /**
     *  Eliminar un juego de la tabla
     * @param juego Juego que queremos eliminar de la bd (id informada)
     */
    public void eliminarJuego(Juego juego){
        Session session = HibernateUtil.getSession();
        Transaction trans = session.beginTransaction();
        try{
            session.delete(juego);
            trans.commit();
        }catch(Exception e){
            e.printStackTrace();
            trans.rollback();
        }
    }
    
    
}
