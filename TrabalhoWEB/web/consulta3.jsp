<%-- 
    Document   : consulta4
    Created on : 04/06/2014, 05:13:54
    Author     : floss
--%>
<%@page import="java.util.List"%>
<%@page import="model.Time" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Time> listaTime = (List<Time>) request.getAttribute("esporteBean");
    if (listaTime.isEmpty()) {
%>
<p>Não foram encontrados resultados.</p>
<%
} else {
    String nome = (String) request.getAttribute("consultaAtual");
    int numPaginas = (Integer) request.getAttribute("numPaginas");
    int pagAtual = (Integer) request.getAttribute("paginaAtual");
    out.println("<p  id=\"paginadores\">");

    if (pagAtual != 1) {

        out.println("<a onclick=\"OpenPage('ConsultaEsporte?esporte=" + nome + "&pagina=" + (pagAtual - 1) + "');\"><< </a>");
    }
    out.println("" + pagAtual + "");
    if (pagAtual < numPaginas) {
        out.println("<a onclick=\"OpenPage('ConsultaEsporte?esporte=" + nome + "&pagina=" + (pagAtual + 1) + "');\"> >></a>");
    }

    out.println("</p>");
%>
<table class="table-fill">
    <th class="text-left"><p>Nome do Time</th>
    <th class="text-left"><p>Esporte</th>
    <th class="text-left"><p>Pais</th>
        </thead>
        <%
            for (Time time : listaTime) {
                out.println("<tbody class=\"table-hover\"> <tr>" + "<td class=\"text-left\">" + time.getNome() + "</td>" + "<td class=\"text-left\">"
                        + time.getEsporte()+ "</td>" + "<td class=\"text-left\">" + time.getPais() + "</td>" + "<tr> </tbody>");
            }
        %>
</table>
<%
        out.println("<p id=\"paginadores\">");

        if (pagAtual != 1) {
            out.println("<a onclick=\"OpenPage('ConsultaEsporte?esporte=" + nome + "&pagina=" + (pagAtual - 1) + "');\"><< </a>");
        }
        out.println("" + pagAtual + "");
        if (pagAtual < numPaginas) {
            out.println("<a onclick=\"OpenPage('ConsultaEsporte?esporte=" + nome + "&pagina=" + (pagAtual + 1) + "');\"> >></a>");
        }

        out.println("</p>");
    }
%>
