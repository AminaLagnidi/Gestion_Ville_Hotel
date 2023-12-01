<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Liste des Villes</title>
</head>
<body>
    <h2>Liste des Villes</h2>
    
    <p>La liste des villes pour la ville : ${villes}</p>

    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nom</th>
            <!-- Add other columns as needed -->
        </tr>
        <c:forEach items="${hotels}" var="hotel">
            <tr>
                <td>${hotel.id}</td>
                <td>${hotel.nom}</td>
                <!-- Add other columns as needed -->
            </tr>
        </c:forEach>
    </table>
</body>
</html>
