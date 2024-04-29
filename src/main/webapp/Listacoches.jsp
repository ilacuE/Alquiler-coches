<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.alquilercoches.Coche" %>
<%@ page import="com.mycompany.alquilercoches.CocheDAO" %>
<!DOCTYPE html>
<html>
<head>
    <% String pageName = "Listado de Coches"; %>
    <title><%= pageName %></title>
</head>
<body>
    <h1>${initParam.webTitle}: <%= pageName %></h1>
    <h2>Coches Disponibles</h2>
    <%
        // Definir las variables antes de usarlas
        String pickupDate = request.getParameter("pickupDate");
        String dropoffDate = request.getParameter("dropoffDate");
        
        // Llamar al método listarCochesDisponibles con las variables definidas
        CocheDAO dao = new CocheDAO();
        List<Coche> lista = dao.listarCochesDisponibles();
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Marca</th>
            <th>Modelo</th>
            <th>Año</th>
            <th>Precio por Día</th>
        </tr>
        <% for(Coche coche : lista) { %>
        <tr>
            <td><%= coche.getId() %></td>
            <td><%= coche.getMarca() %></td>
            <td><%= coche.getModelo() %></td>
            <td><%= coche.getAño() %></td>
            <td><%= coche.getPrecioPorDia() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
