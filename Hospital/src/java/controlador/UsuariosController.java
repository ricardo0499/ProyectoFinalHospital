/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.PacientesDAO;
import modelo.Usuarios;

/**
 *
 * @author emanu
 */
public class UsuariosController extends HttpServlet {

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
        PacientesDAO pacientesDAO = new PacientesDAO();
        try {
            /* TODO output your page here. You may use following sample code. */
            String nombre;
            String contrasena;
            int nivel=0;
            int id=0;
            RequestDispatcher rd=null ;
            
            if(request.getParameter("btn")!=null){
                nombre=request.getParameter("name");
                contrasena=request.getParameter("password");
                Usuarios usuario= (pacientesDAO.validar(nombre,contrasena));
                if(usuario!=null){
                    nivel = usuario.getNivel();
                    nombre = usuario.getNombre();
                    id = usuario.getId();
                    request.setAttribute("nivel",nivel);
                    request.setAttribute("nombre",nombre);
                    request.setAttribute("id", id);
                }else{
                    request.setAttribute("invalid","Nombre de usuario o Contraseña Incorrectos");
                }
                rd=request.getRequestDispatcher("index.jsp");
                
                
            }
            
            rd.forward(request, response);
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
