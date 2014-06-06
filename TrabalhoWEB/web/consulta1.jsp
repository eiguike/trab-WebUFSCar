<%-- 
    Document   : consulta1
    Created on : 04/06/2014, 05:13:54
    Author     : floss
--%>
<%@page import="java.util.List"%>
<%@page import="model.Jogador" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            List<Jogador> listaJogador = (List<Jogador>) request.getAttribute("jogadorBean");
            if (listaJogador.isEmpty()) {
        %>
        <p>Não foram encontrados resultados.</p>
        <%
        } else {
        %>
        <table>
            <thead>
            <th width="180"><p>Nome</th>
            <th width="200"><p>Sobrenome</th>
            <th width="200"><p>Apelido</th>
            <th width="200"><p>Esporte</th>
            <th width="100"><p>Time</th>
        </thead>
        <%
            for (Jogador jogador : listaJogador) {
                out.println("<tr>" + "<td><p>" + jogador.getNome() + "</p></td>" + "<td><p>"
                        + jogador.getSobrenome() + "</p></td>" + "<td><p>" + jogador.getApelido() + "</p></td>"
                        + "<td><p>" + jogador.getEsporte() + "</p></td>"+ "<td><p>" + jogador.getTime() + "</p></td>"
                        + "<tr>");
            }
        %>
    </table>
    <%
        }
    %>

</body>
</html>
