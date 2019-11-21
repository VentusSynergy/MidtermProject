<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<jsp:include page="navbar.jsp" />

<!-- Required meta tags -->
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="CSS/CRURecipe.css">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>Update Recipe: Nom! Meal Plan Architect</title>

<!-- CSS -->
<link href="<c:url value="/CSS/main.css" />" rel="stylesheet">

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
			<div class="col-2"></div>
			<div class="col-8">
				<h2 style="color: #FF5733">Update this New Recipe</h2>
				<c:choose>
					<c:when test="${updateStatus}">
						<h2 style="color: red">Recipe Update Failed!</h2>
					</c:when>
				</c:choose>
				<div class="col-2"></div>
			</div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<form:form action="recipeUpdate.do" method="POST" items="${recipe}">
				
					<div class="form-group">
					
						<label for="title">Recipe Name</label> <input type="text" name="name"
							class="form-control" value="${recipe.name}" required="required">
						<br> 
							
							 <input type="hidden" id="recipe" name="id" value="${recipe.id}">
							 <input type="hidden" id="active" name="active" value="true">
														
							<input type="hidden" id="isPublic" name="isPublic" value="true">
							<!-- <select class="form-control dropdown-info" id="isPublic"
							name="isPublic" required="required">
							<option disabled selected value="">Choose Public/Private</option>
								<option value="true">Public Recipe</option>
								<option value="false">Private Recipe</option>
							</select> -->
							<br>
							
						<label for="prepTime">Prep Time</label>
						<input type="number" min="1" max="1000" name="prepTime"
							class="form-control" required="required" value="${recipe.prepTime}"> 
							<br>
							
						<label for="instructions">Recipe Instructions</label> 
						<input
							type="text" name="instructions" required="required" class="form-control"
							value="${recipe.instructions}"> 
							<br> 
							
							<label for="ingredients">Recipe Ingredients</label> 
							<select class="custom-select" size="8" required="required" multiple name="ingredientIds">
  							<!-- <option selected>Ingredients Currently in Recipe</option> -->
  							<c:forEach var="i" items="${ingredientsIN}">
 							 	<option selected value="${i.id}">${i.name}</option>
							</c:forEach>
							<c:forEach var="i" items="${ingredients}">
 							 	<option value="${i.id}">${i.name}</option>
							</c:forEach>
							</select>
							
							<br>
							
							<%-- <select class="custom-select" multiple name="ingredientIds">
  							<option selected>Choose Recipe Ingredients</option>
  							<c:forEach var="i" items="${ingredients}">
 							 	<option value="${i.id}">${i.name}</option>
							</c:forEach>
							</select> --%>
							
							<label for="photoLink">Photo Link</label> 
							<input type="text"
							name="photoLink" class="form-control"
							value="${recipe.photoLink}"> 
							<br> 
							
							
							<label
							for="category.id">Recipe Category</label>
							<select class="form-control dropdown-info" id="category.id"
							name="category.id" required="required">
							<option selected value="${recipe.category.id}">${recipe.category.name}</option>
								<c:forEach var="category" items="${categories }">
								<option value="${category.id}">${category.name }</option>
								</c:forEach>
						</select>
						<br>
						
						<label
							for="category.id">Recipe Type</label>
						<select class="form-control dropdown-info" id="recipeType.id"
							name="recipeType.id" required="required">
							<option selected value="${recipe.recipeType.id}">${recipe.recipeType.name}</option>
								<c:forEach var="type" items="${types }">
								<option value="${type.id}">${type.name }</option>
								</c:forEach>
						</select>
							
					</div>
					<button type="submit" class="btn btn-warning btn-block">Update
						Recipe</button>
							<label
							for="cookbook"><!-- Cookbook Name --></label> 
							<input
							type="hidden" name="cookbook" class="form-control"
							value="${recipe.cookbook}"> 
							<br> 
							
							<label
							for="cookbookPageNumber"><!-- Cookbook Page # --></label> 
							<input type="hidden"
							name="cookbookPageNumber" class="form-control"
							value="${recipe.cookbookPageNumber}"> 
							<br> 
							
							<label
							for="webLink"><!-- URL Web Link to Recipe --></label> 
							<input type="hidden" name="webLink"
							class="form-control" value="${recipe.webLink}">
							<br>
				</form:form>
				<div class="col-2"></div>
			</div>
		</div>
	</div>
	<br>
	
	<br>
	<br>



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