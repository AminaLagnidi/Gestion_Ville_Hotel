<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Home</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f8ebf8; /* Light lavender background */
            font-family: 'Arial', sans-serif;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .display-4 {
            color: #ff66b2; /* Pink color for display-4 text */
        }

        .btn-primary {
            background-color: #ff66b2; /* Pink color for primary buttons */
            border-color: #ff66b2;
            color: #fff;
        }

        .btn-primary:hover {
            background-color: #ff3385; /* Lighter pink color on hover */
            border-color: #ff3385;
        }
    </style>
</head>
<body>
<div class="container mt-5">
        <h1 class="display-4 text-center mb-4">Bienvenue </h1>
        <form action="HotelController" class="mb-3">
            <button class="btn btn-primary btn-block">Gestion des hotels</button>
        </form>
        
        <form action="VilleController" class="mb-3">
            <button class="btn btn-primary btn-block">Gestion des villes</button>
        </form>
        </div>
    <!-- Add Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>