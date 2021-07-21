<%-- 
    Document   : index
    Created on : 07/15/2021, 3:17:45 p.m.
    Author     : emanu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Citas</title>
        <link rel="stylesheet" href="estilos/estilos.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@900&display=swap" rel="stylesheet">
    </head>
    
    <body>
        <div class="page-header"><img src="img/logo1.png" alt="alt" id="logo"/></div>
        <!--div class="page-header"><h1>Bienvenido! ¿Qué desea Hacer?</h1></div-->
        <div id="slideshow-principal">
            
            <div id="slideshow">
                <!--img src="img/health-care-facilities-covid-es.png" alt="" id="img1"/-->
                <center>
                    <h2 style="margin-left: -30px">¿Qué desea Hacer?</h2>
                    <div id="bot1" ><a href="PacienteController?accion=nuevoP">Nueva Cita</a></div>
                    <div id="bot2" ><a href="PacienteController?accion=verify">Ver detalles de mi cita</a></div>
                </center>
                <div style="margin-top: 20px;"><c:out value="${resp}"/>
                    <br>
                    <c:out value="${id}"/>
                       <br>
                    <c:out value="${fecha}"/>
                       <br>
                    <c:out value="${hora}"/>
                       <br>
                    <c:out value="${medico}"/>
                </div> 
            </div>
        </div>
    <center><div>
                    <img src="img/health-care-facilities-covid-es.png" alt="alt"/>>
                </div></center>
        
       
    </body>
</html>
