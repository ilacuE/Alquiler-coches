<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <% String pageName = "Car Rental"; %>
        <title><%= pageName %></title>
    </head>
    <body>
        <h1>${initParam.webTitle}: <%= pageName %></h1>
        <p>Welcome to our car rental service. Please provide your rental details below:</p>
    
        <form action="searchCars.jsp" method="post">
            <label for="pickupLocation">Pickup Location:</label>
            <input type="text" id="pickupLocation" name="pickupLocation">
            <br>
            <label for="dropoffLocation">Drop-off Location:</label>
            <input type="text" id="dropoffLocation" name="dropoffLocation">
            <br>
            <label for="pickupDate">Pickup Date:</label>
            <input type="date" id="pickupDate" name="pickupDate">
            <br>
            <label for="dropoffDate">Drop-off Date:</label>
            <input type="date" id="dropoffDate" name="dropoffDate">
            <br>
            <input type="submit" value="Search Available Cars">
        </form>
    </body>
</html>
