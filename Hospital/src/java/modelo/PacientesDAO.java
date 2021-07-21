/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author emanu
 */
public class PacientesDAO {
    
    Connection conexion;
    
    
    public PacientesDAO() {
        Conexion con = new Conexion();
        conexion=con.getConexion();
    }
    
    public List<Pacientes> listarPacientes(){
        PreparedStatement ps;
        ResultSet rs;
        
        List<Pacientes> lista;
        lista = new ArrayList<Pacientes>();
        
        try{
            ps=conexion.prepareStatement("SELECT id, nombre, cedula, email, fecha,hora,medico FROM paciente");
            rs=ps.executeQuery();
            while(rs.next()){
                
                int id=rs.getInt("id");
                String nombre=rs.getString("nombre");
                String cedula=rs.getString("cedula");
                String email=rs.getString("email");
                String fecha=rs.getString("fecha");
                String hora=rs.getString("hora");
                String medico=rs.getString("medico");
                
                Pacientes paciente = new Pacientes(id, nombre, cedula, email, fecha, hora, medico);
                lista.add(paciente);
            }
            return lista;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return null;
        }
    }
    
    public List<Pacientes> listarPacientesD(String _nombre){
        PreparedStatement ps;
        ResultSet rs;
        
        List<Pacientes> lista;
        lista = new ArrayList<Pacientes>();
        
        try{
            ps=conexion.prepareStatement("SELECT id, nombre, cedula, email, fecha,hora,medico FROM paciente WHERE medico=?");
            ps.setString(1,_nombre);
            rs=ps.executeQuery();
            while(rs.next()){
                
                int id=rs.getInt("id");
                String nombre=rs.getString("nombre");
                String cedula=rs.getString("cedula");
                String email=rs.getString("email");
                String fecha=rs.getString("fecha");
                String hora=rs.getString("hora");
                String medico=rs.getString("medico");
                
                Pacientes paciente = new Pacientes(id, nombre, cedula, email, fecha, hora, medico);
                lista.add(paciente);
            }
            return lista;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return null;
        }
    }
    
    public Pacientes mostrarPacientes(int _id){
        PreparedStatement ps;
        ResultSet rs;
        
        Pacientes paciente=null;
        
        try{
            ps=conexion.prepareStatement("SELECT id, nombre, cedula, email, fecha,hora,medico FROM paciente WHERE id=?");
            ps.setInt(1,_id);
            rs=ps.executeQuery();
            while(rs.next()){
                
                int id=rs.getInt("id");
                String nombre=rs.getString("nombre");
                String cedula=rs.getString("cedula");
                String email=rs.getString("email");
                String fecha=rs.getString("fecha");
                String hora=rs.getString("hora");
                String medico=rs.getString("medico");
                
                paciente = new Pacientes(id, nombre, cedula, email, fecha, hora, medico);
                
            }
            return paciente;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return null;
        }
    }
     
    public boolean insertar(Pacientes paciente){
        PreparedStatement ps;
        
        try{
            ps=conexion.prepareStatement("INSERT INTO paciente (nombre, cedula, email, fecha, hora, medico) VALUES (?,?,?,?,?,?)");
            ps.setString(1,paciente.getNombre());
            ps.setString(2,paciente.getCedula());
            ps.setString(3,paciente.getEmail());
            ps.setString(4,paciente.getFecha());
            ps.setString(5,paciente.getHora());
            ps.setString(6,paciente.getMedico());
            
            ps.execute();
            
            return true;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return false;
        }
    } 
    
    public boolean actualizar(Pacientes paciente){
        PreparedStatement ps;
        
        try{
            ps=conexion.prepareStatement("UPDATE paciente SET nombre=?, cedula=?, email=?, fecha=?, hora=?, medico=? WHERE id=?");
            ps.setString(1,paciente.getNombre());
            ps.setString(2,paciente.getCedula());
            ps.setString(3,paciente.getEmail());
            ps.setString(4,paciente.getFecha());
            ps.setString(5,paciente.getHora());
            ps.setString(6,paciente.getMedico());
            ps.setInt(7, paciente.getId());
            ps.execute();
            
            return true;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return false;
        }
    } 
    
    public boolean eliminar(int _id){
        PreparedStatement ps;
        
        try{
            ps=conexion.prepareStatement("DELETE FROM paciente WHERE id=?");
            
            ps.setInt(1,_id);
            ps.execute();
            
            return true;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return false;
        }
    } 
    
    public int buscarDisponible(String fecha, String hora, String medico){
        int existe=0;
        try{
            PreparedStatement ps=conexion.prepareStatement("SELECT fecha,hora,medico FROM paciente WHERE fecha=? AND hora=? AND medico=?");
            ps.setString(1, fecha.toString());
            ps.setString(2, hora.toString());
            ps.setString(3, medico.toString());
            ResultSet rs= ps.executeQuery();
            if (rs.next()){
                existe=1;
            }
        }catch(SQLException e){
            System.out.println(e);
            existe=0;
        }
        return existe;
    }
    
    public Pacientes mostrarPacientes1(int _id, String cedula1){
        PreparedStatement ps;
        ResultSet rs;
        
        Pacientes paciente=null;
        
        try{
            ps=conexion.prepareStatement("SELECT id, nombre, cedula, email, fecha,hora,medico FROM paciente WHERE id=? AND cedula=?");
            ps.setInt(1,_id);
            ps.setString(2, cedula1);
            rs=ps.executeQuery();
            while(rs.next()){
                
                int id=rs.getInt("id");
                String nombre=rs.getString("nombre");
                String cedula=rs.getString("cedula");
                String email=rs.getString("email");
                String fecha=rs.getString("fecha");
                String hora=rs.getString("hora");
                String medico=rs.getString("medico");
                
                paciente = new Pacientes(id, nombre, cedula, email, fecha, hora, medico);
                
            }
            return paciente;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return null;
        }
    }
    public Pacientes mostrarPacientes2(String _fecha, String _hora, String _medico){
        PreparedStatement ps;
        ResultSet rs;
        
        Pacientes paciente=null;
        
        try{
            ps=conexion.prepareStatement("SELECT id, nombre, cedula, email, fecha,hora,medico FROM paciente WHERE fecha=? AND hora=? AND medico=?");
            ps.setString(1,_fecha);
            ps.setString(2, _hora);
            ps.setString(3, _medico);
            rs=ps.executeQuery();
            while(rs.next()){
                
                int id=rs.getInt("id");
                String nombre=rs.getString("nombre");
                String cedula=rs.getString("cedula");
                String email=rs.getString("email");
                String fecha=rs.getString("fecha");
                String hora=rs.getString("hora");
                String medico=rs.getString("medico");
                
                paciente = new Pacientes(id, nombre, cedula, email, fecha, hora, medico);
                
            }
            return paciente;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return null;
        }
    }
    public Usuarios validar(String _nombre, String _contrasena){
        PreparedStatement ps;
        ResultSet rs;
        
        Usuarios usuario=null;
        
        try{
            ps=conexion.prepareStatement("SELECT id, nombre, contrasena, nivel FROM users WHERE nombre=? AND contrasena=?");
            ps.setString(1,_nombre);
            ps.setString(2, _contrasena);
            rs=ps.executeQuery();
            while(rs.next()){
                
                int id=rs.getInt("id");
                String nombre=rs.getString("nombre");
                String contrasena=rs.getString("contrasena");
                int nivel=rs.getInt("nivel");
                
                usuario = new Usuarios(id, nombre, contrasena, nivel);
                
            }
            return usuario;
        }
        catch(SQLException e){
            System.out.println(e.toString());
            return null;
        }
    }
    
     
}
