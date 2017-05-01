
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.AccesUsuaris;
import model.Juego;
import model.Usuari;
import model.dao.HibernateUtil;
import model.dao.JuegoDAO;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;


/**
 *
 * @author montse
 * @version març 2017
 */
public class ControladorProductos extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Usuari user = (Usuari) request.getSession().getAttribute("user");
        
        JuegoDAO juegoDao = new JuegoDAO();
        List<Juego> juegos = juegoDao.getAllJuegos();
        request.setAttribute("juegos", juegos);
        if(user != null){
            String accio = request.getParameter("accio");
            if("grabar".equals(accio)){
                String nom = request.getParameter("nom");
                String precio = request.getParameter("precio");
                String url = request.getParameter("url");

                Juego j = new Juego();
                j.setNom(nom);
                
                try{
                    j.setPrecio(Double.parseDouble(precio));
                }catch(NumberFormatException nfe){}
                
                j.setUrl(url);
                juegoDao.grabarJuego(j);

                redireccionarPagina(request, response, "productos.jsp");
            }else if("anadir".equals(accio)){
                redireccionarPagina(request, response, "productos_afegir.jsp");
            }else if("eliminar".equals(accio)){
                Juego juego = new Juego();
                String id = request.getParameter("id");
                juego.setIdjuego(Integer.parseInt(id));
                juegoDao.eliminarJuego(juego);
                juegos = juegoDao.getAllJuegos();
                request.setAttribute("juegos", juegos);
                redireccionarPagina(request, response, "productos.jsp");
            }else{
                redireccionarPagina(request, response, "productos.jsp");
            }
        }
    }
    
    private void redireccionarPagina(HttpServletRequest request, HttpServletResponse response, String url) throws ServletException, IOException{
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response); 
    }
    
        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Handles the HTTP <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    
}
