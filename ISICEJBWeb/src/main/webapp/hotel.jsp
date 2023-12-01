<%@ page import="entities.Ville"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Gestion des hotels</title>
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
	background-color: #ccffcc;
	/* Light green background for success message */
	border-color: #66cc66; /* Green border color for success message */
	color: #008000; /* Dark green text color for success message */
}

.table {
	background-color: #fff;
}
</style>
</head>
<body>
	<div class="container">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<a href="/ISICEJBWeb/index.jsp" class="btn btn-warning"> Back Home</a>
			<h1 class="display-4">Liste des hotels</h1>
			<button type="button" class="btn btn-primary" data-toggle="modal"
				data-target="#exampleModalCenter">Ajouter un hotel</button>
		</div>

		<form action="HotelController" method="post" class="mb-4">
			<div class="form-group">
				<label for="filterVille">Filtre par Ville:</label> <select
					name="filterVille" class="form-control">
					<option value="0">Villes</option>
					<c:forEach items="${villes}" var="ville">
						<option value="${ville.id}">${ville.nom}</option>
					</c:forEach>
				</select> <input type="hidden" name="action" value="filterByVille">
			</div>
			<button type="submit" class="btn btn-primary">Filter</button>
		</form>

		<div class="modal fade" id="exampleModalCenter" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<form action="HotelController" method="post">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalCenterTitle">Ajouter
								un hotel</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<label class="custom-modal-label" for="Name">Nom:</label> <input
								type="text" name="Name" class="form-control" required><br>

							<label class="custom-modal-label" for="adresse">Adresse:</label>
							<input type="text" name="adresse" class="form-control" required><br>

							<label class="custom-modal-label" for="telephone">Telephone:</label>
							<input type="text" name="telephone" class="form-control" required><br>

							<label class="custom-modal-label" for="Ville">Ville:</label> <select
								name="Ville" class="form-control" required>
								<c:forEach items="${villes}" var="ville">
									<option value="${ville.id}">${ville.nom}</option>
								</c:forEach>
							</select>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<input type="submit" class="btn btn-primary" value="Save">
						</div>
					</div>
				</form>
			</div>
		</div>

		<div class="modal fade" id="ModifyHotelModal" tabindex="-1"
			role="dialog" aria-labelledby="ModifyHotelModalTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<form action="HotelController" method="post">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="ModifyHotelModalTitle">Modifier
								un hôtel</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<label class="custom-modal-label" for="Name">Nom:</label> <input
								type="text" name="Name" class="form-control" id="modalHotelNom"
								required><br> <label class="custom-modal-label"
								for="adresse">Adresse:</label> <input type="text" name="adresse"
								class="form-control" id="modalHotelAdresse" required><br>
							<label class="custom-modal-label" for="telephone">Téléphone:</label>
							<input type="text" name="telephone" class="form-control"
								id="modalHotelTelephone" required><br> <label
								class="custom-modal-label" for="Ville">Ville:</label> <select
								name="Ville" class="form-control" id="modalHotelVille" required>
								<c:forEach items="${villes}" var="ville">
									<option value="${ville.id}">${ville.nom}</option>
								</c:forEach>
							</select> <input type="hidden" name="action" value="edit"> <input
								type="hidden" name="id" id="modalHotelId">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<input type="submit" class="btn btn-primary" value="Save Changes">
						</div>
					</div>
				</form>
			</div>
		</div>


		<c:if test="${not empty successMessage}">
			<div class="alert alert-success" role="alert">
				${successMessage}</div>
		</c:if>
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th>ID</th>
					<th>Nom</th>
					<th>Adresse</th>
					<th>Telephone</th>
					<th>Ville</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${hotels}" var="hotel">
					<tr>
						<td>${hotel.id}</td>
						<td>${hotel.nom}</td>
						<td>${hotel.adresse}</td>
						<td>${hotel.telephone}</td>
						<td>${hotel.ville.nom}</td>
						<td class="d-flex align-items-center">
							<form
								onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer cet Hotel ?');"
								action="HotelController" method="post">
								<input type="hidden" name="action" value="delete"> <input
									type="hidden" name="id" value="${hotel.id}">
								<button type="submit" class="btn btn-danger">Supprimer</button>
							</form>
							<button type="button" class="btn btn-secondary ml-2"
								data-toggle="modal" data-target="#ModifyHotelModal"
								data-hotel-id="${hotel.id}" data-hotel-nom="${hotel.nom}"
								data-hotel-adresse="${hotel.adresse}"
								data-hotel-telephone="${hotel.telephone}"
								data-hotel-ville="${hotel.ville.id}">Modifier</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<script>
        $('#ModifyHotelModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var hotelId = button.data('hotel-id');
            var hotelNom = button.data('hotel-nom');
            var hotelAdresse = button.data('hotel-adresse');
            var hotelTelephone = button.data('hotel-telephone');
            var hotelVille = button.data('hotel-ville');
            var modal = $(this);

            modal.find('#modalHotelId').val(hotelId);
            modal.find('#modalHotelNom').val(hotelNom);
            modal.find('#modalHotelAdresse').val(hotelAdresse);
            modal.find('#modalHotelTelephone').val(hotelTelephone);
            modal.find('#modalHotelVille').val(hotelVille);
        });
    </script>
</body>
</html>
