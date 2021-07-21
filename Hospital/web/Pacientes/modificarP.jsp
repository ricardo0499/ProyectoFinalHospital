<%-- 
    Document   : modificar
    Created on : 07/13/2021, 10:34:04 p.m.
    Author     : emanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar</title>
        <link rel="stylesheet" href="estilos/estilos.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@900&display=swap" rel="stylesheet">
    </head>
    
    <body>
        <div class="page-header"><img src="img/logo1.png" alt="alt" id="logo"/></div>
        <h2>Modifique sus datos personales</h2>
    
        <div id="slideshow">
        <form action="PacienteController?accion=actualizar" method="post" autocomplete="off">
            <input class="form-input" id="id" name="id" type="hidden" value="<c:out value="${paciente.id}"/>"/>
            <p>
                Nombre:
                <input class="form-input" id="nombre" name="nombre" type="text" value="<c:out value="${paciente.nombre}"/>"/>
            </p>
            <p>Cédula:
                <input class="form-input" id="cedula" name="cedula" type="text" value="<c:out value="${paciente.cedula}"/>"/></p>
            <p>Email:
                <input class="form-input" id="email" name="email" type="email" value="<c:out value="${paciente.email}"/>"/></p>
            <p>Fecha: <c:out value="${paciente.fecha}" />
                <input class="form-input" id="fecha" name="fecha" type="hidden" value="<c:out value="${paciente.fecha}"/>"/></p>
            <p>Hora: <c:out value="${paciente.hora}"/>
                <input class="form-input" id="hora" name="hora" type="hidden" value="<c:out value="${paciente.hora}"/>" /></p>
            <p>Médico: <c:out value="${paciente.medico}"/>
                <input class="form-input" id="medico" name="medico" type="hidden" value="<c:out value="${paciente.medico}"/>" /></p>
            <center><input class="form-btn" type="submit" name="guardar" id="guardar"/></center>
            
        </form>
    
            <center><form action="PacienteController?accion=inicioCliente"><input class="form-btn" type="submit" value="Volver"></form>
            <a href="PacienteController?accion=eliminar&id=<c:out value="${paciente.id}"/>" style="margin-left: -30px;">Cancelar Cita</a></center>
        </div>
    
</html>
