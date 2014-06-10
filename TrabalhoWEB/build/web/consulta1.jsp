<%-- 
    Document   : consulta1
    Created on : 04/06/2014, 05:13:54
    Author     : floss
--%>
<%@page import="java.util.List"%>
<%@page import="model.Jogador" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Jogador> listaJogador = (List<Jogador>) request.getAttribute("jogadorBean");
    if (listaJogador.isEmpty()) {
%>
<p>Não foram encontrados resultados.</p>
<%
} else {
    String nome = (String) request.getAttribute("consultaAtual");
    int numPaginas = (Integer) request.getAttribute("numPaginas");
    int pagAtual = (Integer) request.getAttribute("paginaAtual");
    String link = "ConsultaJogadores?nomeJogador=" + nome + "&pagina=";   
    
    out.println("<p id=\"paginadores\">");
    if (pagAtual != 1) {
        out.println("<a onclick=\"OpenPage('ConsultaJogadores?nomeJogador=" + nome + "&pagina=" + (pagAtual - 1) + "');\"><< </a>");
    }
    out.println("<a  onclick=\"funcao('"+nome+"','"+pagAtual+"','"+numPaginas+"','ConsultaJogadores?nomeJogador=');\"> " + pagAtual + "</a>");
    if (pagAtual < numPaginas) {
        out.println("<a onclick=\"OpenPage('ConsultaJogadores?nomeJogador=" + nome + "&pagina=" + (pagAtual + 1) + "');\"> >></a>");
    }

    out.println("</p>");
%>
<table class="table-fill">
    <th class="text-left"><p>Nome</th>
    <th class="text-left"><p>Sobrenome</th>
    <th class="text-left"><p>Apelido</th>
    <th class="text-left"><p>Esporte</th>
    <th class="text-left"><p>Time</th>
        </thead>
        <%
            for (Jogador jogador : listaJogador) {
                out.println("<tbody class=\"table-hover\"> <tr>" + "<td class=\"text-left\">" + jogador.getNome() + "</td>" + "<td class=\"text-left\">"
                        + jogador.getSobrenome() + "</td>" + "<td class=\"text-left\">" + jogador.getApelido() + "</td>"
                        + "<td class=\"text-left\">" + jogador.getEsporte() + "</td>" + "<td class=\"text-left\">" + jogador.getTime() + "</td>"
                        + "<tr> </tbody>");
            }
        %>
</table>
<%
        out.println("<p id=\"paginadores\">");

        if (pagAtual != 1) {
            out.println("<a onclick=\"OpenPage('ConsultaJogadores?nomeJogador=" + nome + "&pagina=" + (pagAtual - 1) + "');\"><< </a>");
        }
        out.println("<a  onclick=\"funcao('"+nome+"','"+pagAtual+"','"+numPaginas+"','ConsultaJogadores?nomeJogador=');\"> " + pagAtual + "</a>");
        if (pagAtual < numPaginas) {
            out.println("<a onclick=\"OpenPage('ConsultaJogadores?nomeJogador=" + nome + "&pagina=" + (pagAtual + 1) + "');\"> >></a>");
        }

        out.println("</p>");
    }
%>
