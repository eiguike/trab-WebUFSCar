<%-- 
    Document   : consulta2
    Created on : 07/06/2014, 23:51:06
    Author     : Charmander
--%>

<%@page import="model.Jogador"%>
<%@page import="java.util.List"%>
<%@page import="model.Pais" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Pais> listaPais = (List<Pais>) request.getAttribute("paisBean");
    if (listaPais.isEmpty()) {
%>
<p>Não foram encontrados resultados.</p>
<%
} else {
    String nome = (String) request.getAttribute("consultaAtual");
    int numPaginas = (Integer) request.getAttribute("numPaginas");
    int pagAtual = (Integer) request.getAttribute("paginaAtual");
    String link = "ConsultaPais?nomePais=" + nome + "&pagina=";   
    
    out.println("<p id=\"paginadores\">");
    if (pagAtual != 1) {
        out.println("<a onclick=\"OpenPage('ConsultaPais?nomePais=" + nome + "&pagina=" + (pagAtual - 1) + "');\"><< </a>");
    }
    out.println("<a  onclick=\"funcao('"+nome+"','"+pagAtual+"','"+numPaginas+"','ConsultaPais?nomePais=');\"> " + pagAtual + "</a>");
    if (pagAtual < numPaginas) {
        out.println("<a onclick=\"OpenPage('ConsultaPais?nomePais=" + nome + "&pagina=" + (pagAtual + 1) + "');\"> >></a>");
    }

    out.println("</p>");
%>
<table class="table-fill">
    <th class="text-left"><p>Nome</th>
    <th class="text-left"><p>Sobrenome</th>
    <th class="text-left"><p>Apelido</th>
    <th class="text-left"><p>Esporte</th>
    <th class="text-left"><p>Time</th>
    <th class="text-left"><p>País</th>
    <th class="text-left"><p>Cidade</th>
        </thead>
        <%
            for (Pais pais : listaPais) {
                Jogador jogador;
                jogador = pais.getJogador();
                out.println("<tbody class=\"table-hover\"> <tr>" + "<td class=\"text-left\">" + jogador.getNome() + "</td>" + "<td class=\"text-left\">"
                        + jogador.getSobrenome() + "</td>" + "<td class=\"text-left\">" + jogador.getApelido() + "</td>"
                        + "<td class=\"text-left\">" + jogador.getEsporte() + "</td>" + "<td class=\"text-left\">" + jogador.getTime() + "</td>"
                        + "<td class=\"text-left\">" + pais.getNome() + "</td>" + "<td class=\"text-left\">" + pais.getCidade() + "</td>"
                        + "<tr> </tbody>");
            }
        %>
</table>
<%
        out.println("<p id=\"paginadores\">");

        if (pagAtual != 1) {
            out.println("<a onclick=\"OpenPage('ConsultaPais?nomePais=" + nome + "&pagina=" + (pagAtual - 1) + "');\"><< </a>");
        }
        out.println("<a  onclick=\"funcao('"+nome+"','"+pagAtual+"','"+numPaginas+"','ConsultaPais?nomePais=');\"> " + pagAtual + "</a>");
        if (pagAtual < numPaginas) {
            out.println("<a onclick=\"OpenPage('ConsultaPais?nomePais=" + nome + "&pagina=" + (pagAtual + 1) + "');\"> >></a>");
        }

        out.println("</p>");
    }
%>
