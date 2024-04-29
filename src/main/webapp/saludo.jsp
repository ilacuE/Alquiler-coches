<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <% String pageName = "Car Rental Results"; %>
    <title><%= pageName %></title>
</head>
<body>
    <h1>${initParam.webTitle}: <%= pageName %></h1>
    <h2>Available Cars</h2>
    <!-- Display search results here based on user input -->
    <!-- Sample code to display car details -->
    <%-- 
    Sample code to iterate over list of cars and display details
    <% for(Car car : availableCarsList) { %>
        <p>Car Model: <%= car.getModel() %></p>
        <p>Price per Day: <%= car.getPricePerDay() %></p>
        <p>Available Colors: <%= car.getAvailableColors() %></p>
        <!-- Add more details as needed -->
    <% } %>
    --%>
</body>
</html>
