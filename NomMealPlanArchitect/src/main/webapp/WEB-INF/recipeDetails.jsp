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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<title>Recipe Details: Nom! Meal Plan Architect</title>

<!-- CSS -->
<link href="<c:url value="/CSS/main.css" />" rel="stylesheet">

</head>
<body>
	<h1>Recipe Details</h1>

	<c:choose>
		<c:when test="${not empty recipe}">
			<div class="container">
				<section class="col-xs-12 col-sm-6 col-md-12">
					<article class="search-result row">
						<div class="col-xs-12 col-sm-12 col-md-3">
							<a href="#" title="Lorem ipsum" class="thumbnail"><img
								src="${recipe.photoLink}" alt="Lorem ipsum" height="150px"
								width="auto" /></a>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-2">
							<ul class="meta-search">
								<li><i class="glyphicon glyphicon-calendar"></i> <span>${recipe.dateCreated}</span></li>
								<li><i class="glyphicon glyphicon-time"></i> <span>${recipe.prepTime}</span></li>
								<li><i class="glyphicon glyphicon-tags"></i> <span>${recipe.category.name}</span></li>
							</ul>
						</div>
						<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
							<h3>
								<a href="#" title="">${recipe.name}</a>
							</h3>
							<p>${recipe.instructions}</p>

							<div>
								<form:form class="update" action="updateRecipe.do" method="GET"
									modelAttribute="recipe">
									<button type="submit" name="recipeId" value="${recipe.id}"
										class="glyphicon glyphicon-edit">Update</button>

								</form:form>
							</div>
							<br>
							<div>
								<form:form class="delete" action="deleteRecipe.do" method="POST"
									modelAttribute="recipe">
									<button type="submit" name="id" value="${recipe.id}"
										class="glyphicon glyphicon-remove">Delete</button>

								</form:form>
							</div>

						</div>
						<span class="clearfix borda"></span>
					</article>
				</section>
			</div>
			<hr>
		</c:when>
	</c:choose>
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