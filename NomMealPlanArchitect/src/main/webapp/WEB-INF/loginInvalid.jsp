<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<!-- Bootstrap Header -->
<jsp:include page="navbar.jsp" />

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>Login: Nom! Meal Plan Architect</title>

<!-- CSS -->
<link href="<c:url value="/CSS/login.css" />" rel="stylesheet">
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
	<div class="container">

		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<p class="text-light" id="sorry">Sorry, email and password did
					not match our database. Please try again.</p>
				<h1 class="text-light">Login</h1>
				<form:form action="loginAction.do" method="POST">
					<div class="form-group">
						<label for="exampleInputEmail1" class="text-light">Email
							address</label> <input type="email" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp"
							placeholder="Enter email" name="email">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1" class="text-light">Password</label>
						<input type="password" class="form-control"
							id="exampleInputPassword1" placeholder="Password" name="password">
					</div>
					<button type="submit" class="btn btn-light">Submit</button>
				</form:form>
			</div>


			<div class="col-3"></div>
		</div>

	</div>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>