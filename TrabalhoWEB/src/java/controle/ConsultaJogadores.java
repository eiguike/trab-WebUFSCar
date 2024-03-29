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
import model.Jogador;
import persistence.DAOException;
import persistence.JogadorDAO;

/**
 *
 * @author floss
 */
public class ConsultaJogadores extends HttpServlet {
    private String teste(String username){
        String pagina = "<h1> olá "+username+"!!!!</h1>";
        return pagina;
    }
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ConsultaJogadores</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ConsultaJogadores at " + request.getContextPath() + "</h1>");
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
        String nomedoJogador = request.getParameter("nomeJogador");
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
            
            JogadorDAO jDAO = new JogadorDAO();
            List<Jogador> jogador = jDAO.consultaPrimeira((offset-1)*limite,limite,nomedoJogador);
            
            int numRegistros = jDAO.getNumResultados();
            int numPaginas = (int) Math.ceil(numRegistros*1.0/limite);
             
            // vincula o bean
            request.setAttribute("jogadorBean", jogador);
            request.setAttribute("consultaAtual",nomedoJogador);
            request.setAttribute("numPaginas", numPaginas);
            request.setAttribute("paginaAtual",offset);
            RequestDispatcher dispatcher = null;
            dispatcher = request.getRequestDispatcher("/consulta1.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException exception) {
            Logger.getLogger(Jogador.class.getName()).log(Level.SEVERE, null, exception);
            throw new ServletException(exception.getMessage());
        } catch (DAOException exception) {
            Logger.getLogger(Jogador.class.getName()).log(Level.SEVERE, null, exception);
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
