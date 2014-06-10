/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controle;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Pais;
import persistence.DAOException;
import persistence.PaisDAO;

/**
 *
 * @author Charmander
 */
public class ConsultaPais extends HttpServlet{
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConsultaPais</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConsultaPais at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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
        String nome = request.getParameter("nomePais");
        String pagAtual = request.getParameter("pagina");
        int offset;
        
        if(pagAtual == null)
            offset = 1;
        else
            offset = Integer.parseInt(pagAtual);
        
        if(offset <= 0)
            offset = 1;
        
        try {
            int limite = 4;
            
            PaisDAO pDAO = new PaisDAO();
            List<Pais> pais = pDAO.consultaSegunda((offset-1)*limite,limite,nome);
            
            int numRegistros = pDAO.getNumResultados();
            int numPaginas = (int) Math.ceil(numRegistros*1.0/limite);
             
            // vincula o bean
            request.setAttribute("paisBean", pais);
            request.setAttribute("consultaAtual", nome);
            request.setAttribute("numPaginas", numPaginas);
            request.setAttribute("paginaAtual",offset);
            RequestDispatcher dispatcher = null;
            dispatcher = request.getRequestDispatcher("/consulta2.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException exception) {
            Logger.getLogger(Pais.class.getName()).log(Level.SEVERE, null, exception);
            throw new ServletException(exception.getMessage());
        } catch (DAOException exception) {
            Logger.getLogger(Pais.class.getName()).log(Level.SEVERE, null, exception);
            throw new ServletException(exception.getMessage());
        }

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
