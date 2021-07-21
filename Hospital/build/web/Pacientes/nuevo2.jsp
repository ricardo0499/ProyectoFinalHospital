<%-- 
    Document   : nuevo2
    Created on : 07/14/2021, 7:57:55 p.m.
    Author     : emanu
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reservar</title>
        <link rel="stylesheet" href="estilos/estilos.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@900&display=swap" rel="stylesheet">
    </head>
    
    <body>
        <div class="page-header"><img src="img/logo1.png" alt="alt" id="logo"/></div>
        
    
        <div id="slideshow">
        <form action="PacienteController?accion=insertarP" method="post" autocomplete="off">
            <center><h2 style="margin-bottom: 20px;margin-left: -20px;">Introduzca sus Datos Personales</h2></center>
        <p>
             Nombre:
              <input class="form-input" id="nombre" name="nombre" type="text" required="required"/>
            </p>
            <p>Cédula:<p style="color: grey">Debe escribir su número de Cédula separado por guión (x-xxx-xxxx)</p>
                <input class="form-input" id="cedula" name="cedula" type="text" required="required"  pattern="[0-9]{1,2}-[0-9]{1,4}-[0-9]{1,6}" title="Separado por -"/>
            
            <p>Email:<p style="color: grey">Debe escribir su Email (ejemplo@ejemplo.com)</p>
                <input class="form-input" id="email" name="email" type="email" required="required" pattern="[^@\s]+@[^@\s]+\.[^@\s]+"/>
            <p>Fecha:
                <input class="form-input" id="fecha" name="fecha" type="hidden" value="<c:out value="${fecha}"/>"/><c:out value="${fecha}"/></p>
            <p>Hora: <c:out value="${hora}"/></p>
            <input class="form-input" id="hora" name="hora" type="hidden" value="<c:out value="${hora}"/>"/>
            <p>Médico: <c:out value="${medico}"/>
                <input class="form-input" id="medico" name="medico" type="hidden" value="<c:out value="${medico}"/>"/></p>
                <br>
                <center><input class="form-btn" type="submit" name="enviar" id="enviar" value="Enviar"/></center>
            </form>
                <center><form  action="PacienteController"><input class="form-btn" type="submit" value="Volver"></form></center>
        </div>
    </body>
</html>
