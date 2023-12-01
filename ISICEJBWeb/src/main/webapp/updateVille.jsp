<%@page import="entities.Ville"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Modifier Ville</title>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .container {
            margin-top: 20px;
        }

        form {
            max-width: 400px;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            box-sizing: border-box;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body class="container">

    <form action="VilleController" method="get">
    <input type="hidden" name="action" value="update" />
    <input type="hidden" name="id" value="${v.id}" />
    Nouveau nom : <input type="text" name="updatedVille" /> <br>
    <button type="submit">Enregistrer</button>
</form>

</body>
</html>
