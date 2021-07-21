<%-- 
    Document   : nuevo
    Created on : 07/13/2021, 10:33:51 p.m.
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
        <title>Hospital</title>
        <link rel="stylesheet" href="estilos/estilos.css"/>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+JP:wght@900&display=swap" rel="stylesheet">
    </head>
    
    <body>
        <div class="page-header"><img src="img/logo1.png" alt="alt" id="logo"/></div>
        
    
        <div id="slideshow">
       
        <form action="RController?accion=verificar" method="post" autocomplete="off">
            <center><h2 style="margin-bottom: 20px;margin-left: -20px;">Consulte la disponibilidad</h2></center>
            <p>Fecha:
                <input class="form-input" id="fecha" name="fecha" type="date" min="2021-07-21"/></p>
            <p>Hora:
                <select class="form-input" name="hora" id="hora">
                    <option value="7:00 am">7:00 am</option>
                    <option value="8:00 am">8:00 am</option>
                    <option value="9:00 am">9:00 am</option>
                    <option value="10:00 am">10:00 am</option>
                    <option value="11:00 am">11:00 am</option>
                    <option value="12:00 pm">12:00 pm</option>
                    <option value="1:00 pm">1:00 pm</option>
                    <option value="2:00 pm">2:00 pm</option>
                    <option value="3:00 pm">3:00 pm</option>
                    <option value="4:00 pm">4:00 pm</option>
                  </select>
            <p>Médico:
                <select class="form-input" name="medico" id="medico">
                    <option value="Medico 1">Medico 1</option>
                    <option value="Medico 2">Medico 2</option>
                    <option value="Medico 3">Medico 3</option>
                </select>
                <br>
            <p>
                <br>
                <c:out value="${resp}" /></p>
            <center><input class="form-btn" type="submit" name="verificar" id="verificar" value="Verificar"/></center>
        </form>
            <center><form action="RController?accion=inicioMed2"><input class="form-btn" type="submit" value="Volver"></form></center>
    </div>
    </body>
    <script>
        <script>
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1; //January is 0!
        var yyyy = today.getFullYear();
         if(dd<10){
                dd='0'+dd
            } 
            if(mm<10){
                mm='0'+mm
            } 

        today = yyyy+'-'+mm+'-'+dd;
        document.getElementById("fecha").setAttribute("min", today);
    </script>   
</html>
