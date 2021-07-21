<%-- 
    Document   : index
    Created on : 07/19/2021, 8:07:48 p.m.
    Author     : emanu
--%>

<%@page import="modelo.PacientesDAO"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Pacientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link rel="stylesheet" href="estilos/estilos.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@900&display=swap" rel="stylesheet">
    </head>
    <body>
        <div class="page-header"><img src="img/logo1.png" alt="alt" id="logo"/></div>
        <div id="slideshow" >
            <h2 style="margin-bottom: 30px">Bienvenido</h2>
            <form action="UsuariosController" method="post" autocomplete="off">
                <p>Nombre de Usuario: </p>
                <input class="form-input" type="text" name="name" id="usuario" style="margin-bottom: 30px">
                <p >Contraseña:</p>
                <input class="form-input" type="password" name="password" id="contra">
                <br>
                <c:out value="${invalid}"/>
                <br>
                <center><input class="form-btn" type="submit" name="btn" style="margin-top: 30px" value="Login"></center>
            </form>
            
        </div>
        <%
            HttpSession sesion = request.getSession();
            int nivel = 0;
            int id=0;
            if(request.getAttribute("nivel")!=null){
                nivel=(Integer)request.getAttribute("nivel");
                id=(Integer)request.getAttribute("id");
                if(nivel==1){
                    sesion.setAttribute("nombre", request.getAttribute("nombre"));
                    sesion.setAttribute("nivel", nivel);
                    response.sendRedirect("RController");
                }
                if(nivel==2){
                    sesion.setAttribute("nombre", request.getAttribute("nombre"));
                    sesion.setAttribute("nivel", nivel);
                    response.sendRedirect("RController?accion=inicioMed&nombre="+request.getAttribute("nombre"));
                }
                if(request.getParameter("cerrar")!=null){
                    session.invalidate();
                }
            }
        %>
    </body>
</html>
