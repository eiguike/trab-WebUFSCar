<%-- 
    Document   : consulta1
    Created on : 04/06/2014, 05:13:54
    Author     : floss
--%>
<%@page import="java.util.List"%>
<%@page import="model.Pais" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Pais> listaPais = (List<Pais>) request.getAttribute("listapaisBean");
    if (listaPais.isEmpty()) {
%>
<p>Algo deu muito errado</p>
<%
} else {
%>
<select name="nomePais" id="nomePais">
    <option value=""></option>
<%            
    for (Pais pais : listaPais) {
        out.println("<option value=\""+pais.getNome()+"\">"+pais.getNome()+"</option>");
    }
}
%>
</select>