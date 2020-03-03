<%-- 
    Document   : loginController
    Created on : 03-02-2020, 10:49:06 PM
    Author     : RDragon197
--%>
<%@page import="clases.UsuariosDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   String correo = request.getParameter("correo").trim() != null ? request.getParameter("correo").trim() : "";
    String contraseña = request.getParameter("contraseña").trim() != null ? request.getParameter("contraseña").trim() : "";

    if (correo != "" && contraseña != "") {
        UsuariosDB us = new UsuariosDB();
        out.print(us.consultarUsuarios());
    } else {
         out.print("Error en la consulta");
    }
        

%>
