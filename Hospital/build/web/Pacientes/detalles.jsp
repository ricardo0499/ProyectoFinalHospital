<%-- 
    Document   : detalles
    Created on : 07/15/2021, 12:37:34 a.m.
    Author     : emanu
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.Conexion"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Cita</title>
        <link rel="stylesheet" href="estilos/estilos.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@900&display=swap" rel="stylesheet">
    </head>
     <%
        Conexion con=new Conexion();
        Statement smt;
        ResultSet rs;
        rs=null;
        smt = con.getConexion().createStatement();
    %>
    <body>
        <div class="page-header"><img src="img/logo1.png" alt="alt" id="logo"/></div>
        
        <div id="slideshow">
        <form action="PacienteController?accion=mostrar" method="post" autocomplete="off">
            <center><h2 style="margin-bottom: 20px;margin-left: -20px;">Consultar Mi cita</h2></center>
        <p>Introduzca su número de cita:</p>
        <input class="form-input" type="text" name="id" id="id" required="required"/>
        <p>Introduzca su número de cédula:</p>
            <input class="form-input" type="text" name="cedula" id="cedula" required="required"/>
            <br />
            <br /> 
            
            <center><input class="form-btn" type="submit" value="Ver Detalles"/></center>
        
        </form>
            <center><form action="PacienteController"><input class="form-btn" type="submit" value="Volver"></form></center>
        </div>
    </body>
</html>
