<%-- 
    Document   : modificar
    Created on : 07/13/2021, 10:34:04 p.m.
    Author     : emanu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true" %>
<%
HttpSession sesion = request.getSession();
    System.out.println(sesion.getAttribute("nivel")+" nivel");
    System.out.println(session.getAttribute("nombre"));
    if(sesion.getAttribute("nivel")==null){
        response.sendRedirect("index.jsp");
        
    }else{
        String nivel= sesion.getAttribute("nivel").toString();
        if(!(nivel.equals("1")||nivel.equals("2"))){
            response.sendRedirect("index.jsp");
            System.out.println("1 o 2");
        }
    }
            
        
%>
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
        
    
        <div id="slideshow">
        <form action="RController?accion=actualizar" method="post" autocomplete="off">
            <center><h2 style="margin-bottom: 20px;margin-left: -20px;">Modifique los datos personales</h2></center>
            <input id="id" name="id" type="hidden" value="<c:out value="${paciente.id}"/>"/>
            <p>
                Nombre:
                <input class="form-input" id="nombre" name="nombre" type="text" value="<c:out value="${paciente.nombre}"/>"/>
            </p>
            <p>Cédula:
                <input class="form-input" id="cedula" name="cedula" type="text" value="<c:out value="${paciente.cedula}"/>"/></p>
            <p>Email:
                <input class="form-input" id="email" name="email" type="email" value="<c:out value="${paciente.email}"/>"/></p>
            <p>Fecha: <c:out value="${paciente.fecha}" />
                <input id="fecha" name="fecha" type="hidden" value="<c:out value="${paciente.fecha}" />"/></p>
            <p>Hora: <c:out value="${paciente.hora}"/>
                <input id="hora" name="hora" type="hidden" value="<c:out value="${paciente.hora}"/>" /></p>
            <p>Médico: <c:out value="${paciente.medico}"/>
                <input id="medico" name="medico" type="hidden" value="<c:out value="${paciente.medico}"/>"/></p>
            <center><input class="form-btn" type="submit" name="guardar" id="guardar"/></center>
            
        </form>
            <center><form action="RController?accion=inicioMed2"><input class="form-btn" type="submit" value="Volver"></form></center>
        </div>
    </body>
</html>
