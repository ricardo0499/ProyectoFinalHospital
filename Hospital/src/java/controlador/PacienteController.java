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
import modelo.Pacientes;
import modelo.PacientesDAO;

/**
 *
 * @author emanu
 */
@WebServlet(name = "PacienteController", urlPatterns = {"/PacienteController"})
public class PacienteController extends HttpServlet {

    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PacientesDAO pacientesDAO = new PacientesDAO();
        String accion;
        RequestDispatcher dispatcher = null;
        
        accion = request.getParameter("accion");
        
        if (accion == null || accion.isEmpty()){
            dispatcher= request.getRequestDispatcher("Pacientes/index.jsp");
        } else if("nuevoP".equals(accion)){
            dispatcher= request.getRequestDispatcher("Pacientes/nuevo.jsp");
        }
        
        else if("insertarP".equals(accion)){
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
                Pacientes paciente2 = pacientesDAO.mostrarPacientes2(fecha, hora, medico);
                resp="Se agendó correctamente la cita";
                request.setAttribute("id","ID: " + paciente2.getId());
                request.setAttribute("fecha", "FECHA: "+paciente2.getFecha());
                request.setAttribute("hora", "HORA: "+paciente2.getHora());
                request.setAttribute("medico", "MÉDICO: "+paciente2.getMedico());
                request.setAttribute("resp", resp);
            }else{
                resp="No se agendó correctamente la cita";
                request.setAttribute("resp", resp);
            }
            dispatcher= request.getRequestDispatcher("Pacientes/index.jsp");
            
        }
        else if("modificarP".equals(accion)){
            dispatcher= request.getRequestDispatcher("Pacientes/modificarP.jsp");
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
                Pacientes paciente2 = pacientesDAO.mostrarPacientes2(fecha, hora, medico);
                request.setAttribute("id","CITA N°: " + paciente2.getId());
                request.setAttribute("fecha", "FECHA: "+paciente2.getFecha());
                request.setAttribute("hora", "HORA: "+paciente2.getHora());
                request.setAttribute("medico", "MÉDICO: "+paciente2.getMedico());
                request.setAttribute("resp", resp);
            }else{
                resp="No se actualizó correctamente la cita";
                request.setAttribute("resp", resp);
            }
            dispatcher= request.getRequestDispatcher("Pacientes/index.jsp");
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
            dispatcher= request.getRequestDispatcher("Pacientes/index.jsp");
        }
        else if("verificar".equals(accion)){
            
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            String medico = request.getParameter("medico");
            int disp=pacientesDAO.buscarDisponible(fecha,hora,medico);
            
            if(disp>0){
                dispatcher= request.getRequestDispatcher("Pacientes/nuevo.jsp");
                String resp="La hora y Fecha seleccionadas No están disponibles para el Médico, elija otra";
                request.setAttribute("resp", resp);
            }
            else{
                request.setAttribute("hora", hora);
                request.setAttribute("fecha", fecha);
                request.setAttribute("medico", medico);
                dispatcher= request.getRequestDispatcher("Pacientes/nuevo2.jsp?hora="+hora+"&fecha="+fecha+"&medico="+medico);
                
               
            }
            
        }
        else if("mostrar".equals(accion)){
            dispatcher= request.getRequestDispatcher("Pacientes/mostrar.jsp");
            int id = Integer.parseInt(request.getParameter("id"));
            String cedula = request.getParameter("cedula");
            Pacientes paciente=pacientesDAO.mostrarPacientes1(id,cedula);
            request.setAttribute("paciente", paciente);
        }
        else if("verify".equals(accion)){
            dispatcher= request.getRequestDispatcher("Pacientes/detalles.jsp");
        }
        else if("inicioCliente".equals(accion)){
            dispatcher= request.getRequestDispatcher("Pacientes/index.jsp");
        }
        else{
            
            dispatcher= request.getRequestDispatcher("Pacientes/index.jsp");
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
