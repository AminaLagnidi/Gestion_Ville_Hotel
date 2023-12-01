<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Modifier une Ville</title>
</head>
<body>
    <h2>Modifier une Ville</h2>

    <form action="VilleController" method="post">
        <label for="nom">Nom de la Ville:</label>
        <input type="text" id="nom" name="nom" value="${ville.nom}" required>

        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="id" value="${ville.id}">

        <input type="submit" value="Enregistrer les modifications">
    </form>
    
    <p><a href="VilleController">Retour à la liste des Villes</a></p>
</body>
</html>
