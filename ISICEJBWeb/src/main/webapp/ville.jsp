<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <meta charset="UTF-8">
    <title>Liste des villes</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f7eaf7; /* Light pink background */
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .custom-modal-label {
            font-weight: bold;
            color: #ff66b2; /* Pink color for labels */
        }

        .btn-primary {
            background-color: #6b5b95; /* Dark lavender color for primary buttons */
            border-color: #6b5b95;
            color: #fff;
        }

        .btn-warning {
            background-color: #ff66b2; /* Light pink color for "Back Home" button */
            color: #fff;
        }

        .thead-light th {
            background-color: #ff66b2; /* Pink color for table header */
            color: #fff;
        }

        .alert-success {
            background-color: #ccffcc; /* Light green background for success message */
            border-color: #66cc66; /* Green border color for success message */
            color: #008000; /* Dark green text color for success message */
        }

        .table {
            background-color: #fff; }
    </style>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <a href="/ISICEJBWeb/index.jsp" class="btn btn-warning">Back Home</a>
            <h1 class="display-4">Gestion des Villes</h1>
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#VilleModalCenter">
                Ajouter une ville
            </button>
        </div>

        <!-- Add Ville Modal -->
        <div class="modal fade" id="VilleModalCenter" tabindex="-1" role="dialog" aria-labelledby="VilleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="VilleController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="VilleModalCenterTitle">Ajouter une ville</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="Name">Nom</label>
                            <input type="text" name="Name" class="form-control" required><br><br>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                            <input type="submit" class="btn btn-primary" value="Enregistrer">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- Modify Ville Modal -->
        <div class="modal fade" id="ModifyVilleModal" tabindex="-1" role="dialog" aria-labelledby="ModifyVilleModalTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <form action="VilleController" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="ModifyVilleModalTitle">Modifier une filière</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <label class="custom-modal-label" for="Name">Nom</label>
                            <input type="text" name="Name" class="form-control" id="modalVilleName" required><br><br>

                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="id" id="modalVilleId">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                            <input type="submit" class="btn btn-primary" value="Enregistrer les modifications">
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <%-- Check for success message and display it --%>
        <c:if test="${not empty successMessage}">
            <div class="alert alert-success" role="alert">
                ${successMessage}
            </div>
        </c:if>

        <table class="table">
            <thead class="thead-light">
                <tr>
                    <th>ID</th>
                    <th>Nom</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${villes}" var="Ville">
                    <tr>
                        <td>${Ville.id}</td>
                       
                        <td>${Ville.nom}</td>
                        <td class="d-flex align-items-center">
                            <form onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer cette ville ?');" action="VilleController" method="post">
    <input type="hidden" name="action" value="delete">
    <input type="hidden" name="id" value="${Ville.id}">
    <button type="submit" class="btn btn-danger">Supprimer</button>
</form>

                            <button type="button" class="btn btn-secondary ml-2" data-toggle="modal" data-target="#ModifyVilleModal"
                                    data-ville-id="${Ville.id}"  data-ville-nom="${Ville.nom}">
                                Modifier
                            </button>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

    <script>
        $('#ModifyVilleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var villeId = button.data('ville-id');
            var villeName = button.data('ville-nom');
            var modal = $(this);
            modal.find('#modalVilleName').val(villeName);
            modal.find('#modalVilleId').val(villeId);
        });
    </script>
</body>
</html>