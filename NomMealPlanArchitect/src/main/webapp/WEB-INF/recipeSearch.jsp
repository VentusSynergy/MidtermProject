<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<jsp:include page="publicNavbar.jsp" />

<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>Recipe Search: Nom! Meal Plan Architect</title>

<!-- CSS -->
<link href="<c:url value="/CSS/main.css" />" rel="stylesheet">

</head>
<body>
	<h1>Recipe Search Page</h1>

	<br>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<form:form action="recipeByName.do">
					<div class="form-group">
						<label for="name">Name</label> <input type="text"
							class="form-control" id="name" placeholder="Search Recipe Name">
					</div>
					<button type="submit" class="btn btn-primary">Search
						Recipes by Name</button>
				</form:form>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<form:form action="recipeByIngredient.do" method="GET">
					<div class="form-group">
						<select class="form-control dropdown-info" id="ingredient"
							name="ingredient" required>
							<option disabled selected value="">Choose a Recipe
								Ingredient</option>
							<c:forEach var="i" items="${recipeIngredient}">
								<option>${i}</option>
							</c:forEach>
						</select>
						<button type="submit" class="btn btn-info btn-block">Search
							Recipes by Ingredient</button>
					</div>
				</form:form>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<form:form action="recipeByCategory.do" method="GET">
					<div class="form-group">
						<select class="form-control dropdown-info" id="category"
							name="category" required>
							<option disabled selected value="">Choose a Recipe
								Category</option>
							<c:forEach var="r" items="${recipeCategory}">
								<option>${r}</option>
							</c:forEach>
						</select>
						<button type="submit" class="btn btn-info btn-block">Search
							Recipes by Category</button>
					</div>
				</form:form>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<form:form action="recipeByType.do" method="GET">
					<div class="form-group">
						<select class="form-control dropdown-info" id="type" name="type"
							required>
							<option disabled selected value="">Choose a Meal Type</option>
							<c:forEach var="t" items="${recipeTypes}">
								<option>${t}</option>
							</c:forEach>
						</select>
						<button type="submit" class="btn btn-info btn-block">Search
							Recipes by Meal Type</button>
					</div>
				</form:form>
			</div>
			<div class="col-2"></div>
		</div>
	</div>

	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<form:form action="recipeByCookbook.do" method="GET">
					<div class="form-group">
						<select class="form-control dropdown-info" id="cookbook"
							name="cookbook" required>
							<option disabled selected value="">Choose a Cookbook</option>
							<c:forEach var="c" items="${recipeCookbooks}">
								<option>${c}</option>
							</c:forEach>
						</select>
						<button type="submit" class="btn btn-info btn-block">Search
							Recipes by Cookbook</button>
					</div>
				</form:form>
			</div>
			<div class="col-2"></div>
		</div>
	</div>


	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<form:form action="recipeByKeyword.do" method="GET">
					<div class="form-group">
						<label for="keyword">Keyword</label> <input type="text"
							class="form-control" id="keyword" placeholder="Search by Keyword">
					</div>
					<button type="submit" class="btn btn-primary">Search
						Recipes by Keyword</button>
				</form:form>
			</div>
			<div class="col-2"></div>
		</div>
	</div>



	<br>
	<br>

	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<form:form action="allRecipes.do" method="GET">
					<button type="submit" class="btn btn-success btn-block">List
						All Recipes</button>
				</form:form>
			</div>
			<div class="col-2"></div>
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