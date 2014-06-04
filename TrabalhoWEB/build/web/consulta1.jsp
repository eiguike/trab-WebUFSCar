<%-- 
    Document   : consulta1
    Created on : 04/06/2014, 05:13:54
    Author     : floss
--%>
<%@page import="model.Jogador" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% Jogador objJogador = (Jogador)request.getAttribute("jogadorBean");%>
        <h1>Bem vindo ao sistema de caronas <%= objJogador.getApelido() %></h1>  
    </body>
</html>
