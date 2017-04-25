package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
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

/**
 *
 * @author montse
 * @version març 2017
 */
public class ControladorCompras extends HttpServlet {

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
        try {

            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();

            AccesUsuaris bd = new AccesUsuaris();
            Usuari u = (Usuari) request.getAttribute("usu");
            Usuari user = bd.validarUsuari(u);

            ResultSet juegos = bd.GetJuegos();
            List<Juego> listajuegos=new ArrayList<Juego>();

            while (juegos.next()) {
                Juego joc = new Juego();
                
                joc.setNom(juegos.getString("nom"));
                joc.setIdjuego(juegos.getInt("idjuego"));
                joc.setPrecio(juegos.getDouble("precio"));
                joc.setUrl(juegos.getString("url"));
                listajuegos.add(joc);

            }

            request.setAttribute("user", user);
            request.setAttribute("juegos", listajuegos);

            RequestDispatcher rd = request.getRequestDispatcher("comprar.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            System.out.println("CONTROLADOR COMPRAS!!!!!" + e);
            System.out.println("hola");
            throw new ServletException(e);
            // System.out.println(e);
        }
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
