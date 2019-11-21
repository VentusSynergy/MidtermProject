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

<title>User Profile: Nom! Meal Plan Architect</title>

<!-- CSS -->
<link href="<c:url value="/CSS/userprofile.css" />" rel="stylesheet">

</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
				<form:form action="loginAction.do" method="POST"
					modelAttribute="user">
				<h2 style="text-align: center">${loggedInUser.firstName}'s Profile</h2>
<div class="container">
    <div class="fb-profile">
        <img align="left" class="fb-image-lg" src="https://cms.splendidtable.org/sites/default/files/styles/w2000/public/cooks-in-kitchen_pidjoe-iStock-GettyImagesPlus-LEDE.jpg?itok=pMpz8wND" alt="Profile image example"/>
        <img align="left" class="fb-image-profile thumbnail" src="${loggedInUser.avatarURL }" alt="Profile image example"/>
        <div class="fb-profile-text">
            <h1>${loggedInUser.firstName} ${loggedInUser.lastName }</h1>
            <p>Life is too complicated not to be orderly.<br><i class="fa fa-envelope"></i>    ${loggedInUser.email}</p>
        </div>
    </div>
</div>
				</form:form>

<br>
<br>
<br>
<br>
<br>
<hr>
	<!-- Users Saved Recipes -->
	<hgroup class="mb20">
		<h1 style="text-align: center">Saved Recipes</h1>
		<h2 class="lead" style="text-align: center">
			<strong class="text-danger">${fn: length(favList)}</strong> recipes
			have been added to your profile.
		</h2>
	</hgroup>
	<c:choose>
		<c:when test="${not empty favList}">
			<c:forEach var="fl" items="${favList}">
				<div class="container">
					<section class="col-xs-12 col-sm-6 col-md-12">
						<article class="search-result row">
							<div class="col-xs-12 col-sm-12 col-md-3">
								<a href="#" title="Lorem ipsum" class="thumbnail"><img
									src="${fl.recipe.photoLink}" alt="Lorem ipsum" height="150px"
									width="auto" /></a>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-2">
								<ul class="meta-search">
									<li><i class="glyphicon glyphicon-calendar"></i> <span>${fl.recipe.dateCreated}</span></li>
									<li><i class="glyphicon glyphicon-time"></i> <span>${fl.recipe.prepTime}</span></li>
									<li><i class="glyphicon glyphicon-tags"></i> <span>${fl.recipe.category.name}</span></li>
								</ul>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-7 excerpet">
								<h3>
									<a href="searchOneRecipe.do?recipeId=${fl.recipe.id }" title="">${fl.recipe.name}</a>
								</h3>
								<p>${fl.recipe.instructions}</p>

								<%-- <c:set var="isFavorite" value="false" />
								<c:forEach var="fl" items="${favList}">
									<c:if test="${fl.recipe.id == r.id}">
										<c:set var="isFavorite" value="true" />
									</c:if>
								</c:forEach> --%>
								<%-- <c:choose>

									<c:when test="${isFavorite == true}">
										<form class="plus" action="addRecipeToUser.do" method="POST">
											<button class="glyphicon glyphicon-plus" disabled>Added</button>
											<input type="hidden" name="id" value="${r.id}"> <input
												type="hidden" name="key" value="${key}">
										</form>
									</c:when>

									<c:otherwise>
										<form class="plus" action="addRecipeToUser.do" method="POST">
											<button class="glyphicon glyphicon-plus">Add</button>
											<input type="hidden" name="id" value="${r.id}"> <input
												type="hidden" name="key" value="${key}">
										</form>
									</c:otherwise>

								</c:choose> --%>
								<div>
									<form:form class="update" action="updateRecipe.do" method="GET"
										modelAttribute="recipe">
										<button type="submit" name="recipeId" value="${fl.recipe.id}"
											class="glyphicon glyphicon-edit">Update</button>

									</form:form>
								</div>
								<div>
									<form:form class="removeFav" action="removeFav.do"
										method="POST" modelAttribute="recipe">
										<button type="submit" name="id" value="${fl.id}"
											class="glyphicon glyphicon-remove">Remove From Favorites</button>

									</form:form>
								</div>

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