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


<title>Recipe Details: Nom!</title>

<!-- CSS -->
<link href="<c:url value="/CSS/recipeDetails.css" />" rel="stylesheet">

</head>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<h1>Recipe Details</h1>

		<c:choose>
			<c:when test="${not empty recipe}">
				<div class="container">
					<section class="col-xs-12 col-sm-6 col-md-12">
						<article class="search-result row">
							<c:if test="${not empty recipe.photoLink}">
								<div class="col-xs-12 col-sm-12 col-md-3">
									<a href="#" title="recipe.photoLink" class="thumbnail"><img
										src="${recipe.photoLink}" alt="recipe.photoLink"
										height="200px" width="220" /></a>
								</div>
							</c:if>

							<div class="col-xs-12 col-sm-12 col-md-3">
								<ul class="meta-search">
									<li><i class="glyphicon glyphicon-calendar"></i> <span>Created:
											${recipe.dateCreated}</span></li>
									<li><i class="glyphicon glyphicon-time"></i> <span>Prep
											Time: ${recipe.prepTime} minutes</span></li>
									<li><i class="glyphicon glyphicon-tags"></i> <span>Category:
											${recipe.category.name}</span></li>
								</ul>
							</div>
							<div class="col-xs-12 col-sm-12 col-md-6 excerpet">
								<h3>${recipe.name}</h3>

								<h4>Ingredients:</h4>
								<c:choose>
									<c:when test="${not empty recipe.recipeIngredients}">
										<ul>
											<c:forEach var="recipeIngredients"
												items="${recipe.recipeIngredients}">
												<li>${recipeIngredients.ingredient.name}</li>
											</c:forEach>
										</ul>
									</c:when>

									<c:otherwise>
										<p>Sorry, no ingredients listed.</p>

									</c:otherwise>
								</c:choose>
								<h4>Directions:</h4>
								<p>${recipe.instructions}</p>

								<c:set var="isFavorite" value="false" />
								<c:forEach var="fl" items="${favList}">
									<c:if test="${fl.recipe.id == recipe.id}">
										<c:set var="isFavorite" value="true" />
									</c:if>
								</c:forEach>
								<div class="row">
									<div class="col-xs-4 col-xs-4 col-xs-6 text-center">
										<c:choose>
											<c:when test="${isFavorite == true}">
												<form class="plus" action="searchOneRecipePost.do"
													method="POST">
													<button class="btn btn-outline-info" disabled>Added</button>
													<input type="hidden" name="recipeId" value="${recipe.id}">
													<input type="hidden" name="key" value="${key}">
												</form>
											</c:when>

											<c:otherwise>
												<c:if test="${loggedInUser.active eq true}">
													<form class="plus" action="searchOneRecipePost.do"
														method="POST">
														<button class="btn btn-info">Add</button>
														<input type="hidden" name="recipeId" value="${recipe.id}">
														<input type="hidden" name="key" value="${key}">
													</form>
												</c:if>
											</c:otherwise>

										</c:choose>
									</div>

									<c:if test="${loggedInUser.active eq true }">
										<div>
											<form:form class="update" action="updateRecipe.do"
												method="GET" modelAttribute="recipe">
												<button type="submit" name="recipeId" value="${recipe.id}"
													class="btn btn-warning">Update</button>

											</form:form>
										</div>
									</c:if>
									<div>
										<c:if test="${loggedInUser.admin eq true }">
											<form:form class="delete" action="deleteRecipe.do"
												method="POST" modelAttribute="recipe">
												<button type="submit" name="id" value="${recipe.id}"
													class="btn btn-danger">ADMIN: Delete</button>

											</form:form>
										</c:if>
										<c:if test="${loggedInUser.id eq recipe.user.id }">
											<form:form class="delete" action="deleteRecipe.do"
												method="POST" modelAttribute="recipe">
												<button type="submit" name="id" value="${recipe.id}"
													class="btn btn-danger">Delete</button>

											</form:form>
										</c:if>
									</div>
								</div>
								<span class="clearfix borda"></span>
						</article>
					</section>
				</div>
				<hr>
			</c:when>
		</c:choose>

		<br>
		<div class="container">
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10">
					<%-- <c:choose>
						<c:when test="${not empty recipe.reviews}"> 
							<h3>Average Rating:</h3>
							<h3>put the stars right here**************************</h3>
							<h3> ${recipereview.ratingStars(averageRating)} </h3>
							
							<br>
						</c:when>
					</c:choose>  --%>
					<h3>Recipe Reviews:</h3>
					<c:choose>
						<c:when test="${not empty recipe.reviews}">
							<ul>
								<c:forEach var="review" items="${recipe.reviews}">
									<c:if test="${review.active eq true}">
										<li>Rating: ${review.ratingStars(rating)}
											<ul>
												<li>Review: ${review.comment}</li>
												<li>${review.user.firstName}&nbsp${review.user.lastName}&nbsp${review.reviewDate}</li>
												<c:if test="${loggedInUser.id eq review.user.id }">

													<form action="reviewDeactivate.do" method="POST">

														<input type="hidden" name="id" id="review"
															value="${review.id}" />

														<button type="submit" class="btn btn-danger">Remove
															Review</button>

													</form>

												</c:if>
												<c:if test="${loggedInUser.admin eq true }">

													<form action="reviewDeactivate.do" method="POST">

														<input type="hidden" name="id" id="review"
															value="${review.id}" />

														<button type="submit" class="btn btn-danger">ADMIN:
															Remove Review</button>

													</form>

												</c:if>
											</ul>
										</li>
										<br>
									</c:if>
								</c:forEach>
							</ul>
						</c:when>

						<c:otherwise>
							<p>No reviews just yet.</p>

						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
		<br>
		<div class="container">
			<div class="row">
				<div class="col-1"></div>
				<div class="col-10">
					<h3>Review this recipe:</h3>
					<c:choose>
						<c:when test="${loggedInUser.active eq true }">

							<form:form action="review.do" method="POST"
								modelAttribute="newReview">

								<label for="rating">Rating (1-5):</label>
								<input type="number" name="rating" class="form-control"
									placeholder="rating 1-5" required="required" min="1" max="5"
									id="rating">
								<br>
								<label for="comment">Review Comment: </label>
								<input type="text" name="comment" class="form-control"
									placeholder="review comment" required="required" id="comment">
								<br>

								<input type="hidden" name="active" id="active" value="true" />
								<input type="hidden" name="recipe.id" id="recipe"
									value="${recipe.id}" />

								<input type="hidden" name="user.id" id="user"
									value="${loggedInUser.id}" />

								<button type="submit" class="btn btn-primary">Submit</button>

							</form:form>
						</c:when>

						<c:otherwise>
							<p>
								Please <a href="login.do" class="badge badge-dark">login</a> or
								<a href="register.do" class="badge badge-dark">register</a> to
								review this recipe.
							</p>

						</c:otherwise>
					</c:choose>
				</div>
				<div class="col-1"></div>
			</div>
		</div>
		<br> <br> <br>
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