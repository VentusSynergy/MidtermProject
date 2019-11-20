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
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<title>Recipe Search Results: Nom! Meal Plan Architect</title>
<!-- CSS -->
<link href="<c:url value="/CSS/recipeSearchResult.css" />"
	rel="stylesheet">
</head>
<body>
	<h1>Recipe Search Results Page</h1>
	<hgroup class="mb20">
		<h1>Search Results</h1>
		<h2 class="lead">
			<strong class="text-danger">${fn: length(recipe)}</strong> results
			were found for the search for: 
			<c:choose>
				<c:when test="${not empty key }">
					 <strong class="text-danger">${key}</strong>
				</c:when>
				<c:when test="${not empty type}">
					<strong class="text-danger">${type}</strong>
				</c:when>
				<c:when test="${not empty category}">
					<strong class="text-danger">${category}</strong>
				</c:when> 
			</c:choose>
		</h2>
	</hgroup>
	<c:choose>
		<c:when test="${not empty recipe}">
			<c:forEach var="r" items="${recipe}">
				<div class="container">
					<section class="col-xs-12 col-sm-6 col-md-12">
						<article class="search-result row">
							<div class="col-xs-12 col-sm-12 col-md-3">
								<a href="#" title="Lorem ipsum" class="thumbnail"><img
									src="${r.photoLink}" alt="Lorem ipsum" height="150px"
									width="auto" /></a>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-2">
								<ul class="meta-search">
									<li><i class="glyphicon glyphicon-calendar"></i> <span>${r.dateCreated}</span></li>
									<li><i class="glyphicon glyphicon-time"></i> <span>${r.prepTime}
											minutes</span></li>
									<li><i class="glyphicon glyphicon-tags"></i> <span>${r.category.name}</span></li>
								</ul>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
								<h3>
									<a href="searchOneRecipe.do?recipeId=${r.id }" title="">${r.name}</a>
								</h3>
								<p>${r.instructions}</p>

								<c:set var="isFavorite" value="false" />
								<c:forEach var="fl" items="${favList}">
									<c:if test="${fl.recipe.id == r.id}">
										<c:set var="isFavorite" value="true" />
									</c:if>
								</c:forEach>
								<c:choose>

									<c:when test="${isFavorite == true}">
										<form class="plus" action="addRecipeToUser.do" method="POST">
											<button class="glyphicon glyphicon-plus" disabled>Added</button>
											<input type="hidden" name="id" value="${r.id}"> <input
												type="hidden" name="key" value="${key}">
										</form>
									</c:when>

									<c:otherwise>
										<c:if test="${!empty loggedInUser.email}">
											<form class="plus" action="addRecipeToUser.do" method="POST">
												<button class="glyphicon glyphicon-plus">Add</button>
												<input type="hidden" name="id" value="${r.id}"> <input
													type="hidden" name="key" value="${key}">
											</form>
										</c:if>
									</c:otherwise>

								</c:choose>
								<c:if test="${!empty loggedInUser.email}">
									<div>
										<form:form class="update" action="updateRecipe.do"
											method="GET" modelAttribute="recipe">
											<button type="submit" name="recipeId" value="${r.id}"
												class="glyphicon glyphicon-edit">Update</button>

										</form:form>
									</div>
								</c:if>
								<br>
								<c:if test="${!empty loggedInUser.email}">
									<div>
										<form:form class="delete" action="deleteRecipe.do"
											method="POST" modelAttribute="recipe">
											<button type="submit" name="id" value="${r.id}"
												class="glyphicon glyphicon-remove">Delete</button>

										</form:form>
									</div>
								</c:if>

							</div>
							<span class="clearfix borda"></span>
						</article>
					</section>
				</div>
				<hr>
			</c:forEach>
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


