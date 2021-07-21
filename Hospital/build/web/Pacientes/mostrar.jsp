<%-- 
    Document   : mostrar
    Created on : 07/15/2021, 2:42:14 p.m.
    Author     : emanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles</title>
        <link rel="stylesheet" href="estilos/estilos.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@900&display=swap" rel="stylesheet">
    </head>
    
    <body>
        <div class="page-header"><img src="img/logo1.png" alt="alt" id="logo"/></div>
        <h2>Detalles de la Cita</h2>
    
        <div id="slideshow">
        <form action="PacienteController?accion=modificarP" method="post" autocomplete="off">
            <input id="id" name="id" type="hidden" value="<c:out value="${paciente.id}"/>"/>
            <p>
                Nombre:
                <input class="form-input" id="nombre" name="nombre" type="text" value="<c:out value="${paciente.nombre}"/>" disabled/>
            </p>
            <p>Cédula:
                <input class="form-input" id="cedula" name="cedula" type="text" value="<c:out value="${paciente.cedula}"/>" disabled/></p>
            <p>Email:
                <input class="form-input" id="email" name="email" type="email" value="<c:out value="${paciente.email}"/>" disabled/></p>
            <p>Fecha:
                <input class="form-input" id="fecha" name="fecha" type="text" value="<c:out value="${paciente.fecha}" />" disabled/></p>
            <p>Hora:
                <input class="form-input" id="hora" name="hora" type="text" value="<c:out value="${paciente.hora}"/>" disabled/></p>
            <p>Médico:
                <input class="form-input" id="medico" name="medico" type="text" value="<c:out value="${paciente.medico}"/>" disabled/></p>
            <center><input class="form-btn" type="submit" name="guardar" id="guardar" value="Modificar Datos"/></center>
            
        </form>
            <center> <form action="PacienteController?action=inicioCliente"><input class="form-btn" type="submit" value="Volver"></form>
           <a href="PacienteController?accion=eliminar&id=<c:out value="${paciente.id}"/>" style="margin-left: -30px;">Cancelar Cita</a></center>
    </div>
        </body>
</html>
