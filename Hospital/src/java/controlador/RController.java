/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Pacientes;
import modelo.PacientesDAO;

/**
 *
 * @author emanu
 */
@WebServlet(name = "RController", urlPatterns = {"/RController"})
public class RController extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PacientesDAO pacientesDAO = new PacientesDAO();
        String accion;
        RequestDispatcher dispatcher = null;
        
        accion = request.getParameter("accion");
        
        if (accion == null || accion.isEmpty()){
            
            dispatcher= request.getRequestDispatcher("Recepcion/index.jsp");
            List<Pacientes> listaPacientes = pacientesDAO.listarPacientes();
            request.setAttribute("lista", listaPacientes);
        }
         else if("nuevoR".equals(accion)){
            dispatcher= request.getRequestDispatcher("Recepcion/nuevo.jsp");
        }
         else if("inicioMed".equals(accion)){
           HttpSession sesion = request.getSession();
           dispatcher= request.getRequestDispatcher("Recepcion/index.jsp");
           String id=request.getParameter("nombre");
            List<Pacientes> listaPacientes = pacientesDAO.listarPacientesD(id);
            request.setAttribute("lista", listaPacientes);
        }
         else if("inicioMed2".equals(accion)){
           HttpSession sesion = request.getSession();
           dispatcher= request.getRequestDispatcher("Recepcion/index.jsp");
           String id=(String)sesion.getAttribute("nombre");
           System.out.println(id+" comp");
            List<Pacientes> listaPacientes = pacientesDAO.listarPacientesD(id);
            request.setAttribute("lista", listaPacientes);}
        else if("insertar".equals(accion)){
            String nombre = request.getParameter("nombre");
            String cedula = request.getParameter("cedula");
            String email = request.getParameter("email");
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            String medico = request.getParameter("medico");
            
            Pacientes paciente=new Pacientes(0, nombre, cedula, email, fecha, hora, medico);
            boolean x= pacientesDAO.insertar(paciente);
            String resp;
            if(x){
                resp="Se agendó correctamente la cita";
                request.setAttribute("resp", resp);
            }else{
                resp="No se agendó correctamente la cita";
                request.setAttribute("resp", resp);
            }
            dispatcher= request.getRequestDispatcher("Recepcion/index.jsp");
            List<Pacientes> listaPacientes = pacientesDAO.listarPacientes();
            request.setAttribute("lista", listaPacientes);
        }
        
        else if("modificar".equals(accion)){
            dispatcher= request.getRequestDispatcher("Recepcion/modificar.jsp");
            int id = Integer.parseInt(request.getParameter("id"));
            Pacientes paciente=pacientesDAO.mostrarPacientes(id);
            request.setAttribute("paciente", paciente);
        }
        else if("actualizar".equals(accion)){
            int id = Integer.parseInt(request.getParameter("id"));
            String nombre = request.getParameter("nombre");
            String cedula = request.getParameter("cedula");
            String email = request.getParameter("email");
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            String medico = request.getParameter("medico");
            Pacientes paciente=new Pacientes(id, nombre, cedula, email, fecha, hora, medico);
            boolean x= pacientesDAO.actualizar(paciente);
            String resp;
            if(x){
                resp="Se actualizaron correctamente los datos";
                request.setAttribute("resp", resp);
            }else{
                resp="No se actualizó correctamente la cita";
                request.setAttribute("resp", resp);
            }
            dispatcher= request.getRequestDispatcher("Recepcion/index.jsp");
            List<Pacientes> listaPacientes = pacientesDAO.listarPacientes();
            request.setAttribute("lista", listaPacientes);
        }
        else if("eliminar".equals(accion)){
            int id = Integer.parseInt(request.getParameter("id"));
          
            boolean x= pacientesDAO.eliminar(id);
            String resp="";
            if(x){
                resp="Se Canceló correctamente la cita";
                request.setAttribute("resp", resp);
            }else{
                resp="No se pudo cancelar la cita";
                request.setAttribute("resp", resp);
            }
            dispatcher= request.getRequestDispatcher("Recepcion/index.jsp");
            List<Pacientes> listaPacientes = pacientesDAO.listarPacientes();
            request.setAttribute("lista", listaPacientes);
        }
        else if("verificar".equals(accion)){
            
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            String medico = request.getParameter("medico");
            int disp=pacientesDAO.buscarDisponible(fecha,hora,medico);
            
            if(disp>0){
                dispatcher= request.getRequestDispatcher("Recepcion/nuevo.jsp");
                String resp="La hora y fecha seleccionadas NO están disponibles para el Médico, elija otra";
                request.setAttribute("resp", resp);
            }
            else{
                request.setAttribute("hora", hora);
                request.setAttribute("fecha", fecha);
                request.setAttribute("medico", medico);
                dispatcher= request.getRequestDispatcher("Recepcion/nuevo2.jsp?hora="+hora+"&fecha="+fecha+"&medico="+medico);
            }
            
        }
        else{
            
            dispatcher= request.getRequestDispatcher("Recepcion/index.jsp");
            List<Pacientes> listaPacientes = pacientesDAO.listarPacientes();
            request.setAttribute("lista", listaPacientes);
        }
        
        
        dispatcher.forward(request, response);
        
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
