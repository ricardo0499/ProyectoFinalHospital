<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
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
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hospital X</title>
        <link rel="stylesheet" href="estilos/estilos.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@900&display=swap" rel="stylesheet">
    </head>
    
    <body>
        <div class="page-header"><img src="img/logo1.png" alt="alt" id="logo"/>
            <div align="right">
                <h3>Bienvenido <%= sesion.getAttribute("nombre")%></h3>
                <a href="index.jsp?cerrar=true" style="text-decoration: underline">Cerrar Sesión</a>
            </div>
        </div>
    <center><h2 style="">Lista de Citas</h2></center>
        <br/><br/>
    <center>
        <table border="1" width="80%" id="customers">
            <thead>
                <tr>
                    <th>ID</th> 
                    <th>Nombre y Apellido</th>
                    <th>Cedula</th>
                    <th>Email</th>
                    <th>Fecha</th>
                    <th>Hora de cita</th>
                    <th>Médico</th>
                    <th>Actualizar</th>
                    <th>Cancelar</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="paciente" items="${lista}">
                    <tr>
                        <td><c:out value="${paciente.id}"/></td>
                        <td><c:out value="${paciente.nombre}"/></td>
                        <td><c:out value="${paciente.cedula}"/></td>
                        <td><c:out value="${paciente.email}"/></td>
                        <td><c:out value="${paciente.fecha}"/></td>
                        <td><c:out value="${paciente.hora}"/></td>
                        <td><c:out value="${paciente.medico}"/></td>
                        <td><a href="RController?accion=modificar&id=<c:out value="${paciente.id}"/>" style="text-decoration: underline">Modificar</a></td>
                        <td><a href="RController?accion=eliminar&id=<c:out value="${paciente.id}"/>" style="text-decoration: underline">Cancelar</a></td>
                    
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <c:out value="${resp}"/>
        </center>
        <div style="margin-left: 5%;margin-top: 15px;"><a href="RController?accion=nuevoR" style="color: white; font-size: 13pt;text-decoration: underline">Agendar Nueva Cita +</a></div>
        
    </body>
</html>
