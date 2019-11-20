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

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Home: Nom! Meal Plan Architect</title>

<link href="<c:url value="/CSS/index.css" />" rel="stylesheet">
</head>
<body>
	<div class="top-container">
		<h1 class="app-title">
			<em>NOM</em>
		</h1>
	</div>
	<section id="team" class="pb-5">
		<h5 class="section-title h1">This Weeks Picks</h5>
		<div class="container">
			<div class="row">
				<!-- Pick One -->
				<div class="col-xs-12 col-sm-6 col-md-4">
					<div class="image-flip"
						ontouchstart="this.classList.toggle('hover');">
						<div class="mainflip">
							<div class="frontside">
								<div class="card">
									<div class="card-body text-center">
										<p>
											<img class=" img-fluid" src="https://i.imgur.com/jUbocnU.gif"
												alt="card image">
										</p>
										<h4 class="card-title">Garlic-Butter Steak</h4>
										<p class="card-text">This is the perfect way to add more
											flavor to a steak. I'm not sure I can eat a steak without
											this butter now!</p>
										<a href="#" class="btn btn-primary btn-sm"><i
											class="fa fa-plus"></i></a>
									</div>
								</div>
							</div>
							<div class="backside">
								<div class="card">
									<div class="card-body text-center mt-4">
										<h4 class="card-title">Ingredients</h4>
										<ul class="card-text">
											<li>2 tablespoons butter, softened, divided</li>
											<li>1 teaspoon minced fresh parsley</li>
											<li>1/2 teaspoon minced garlic</li>
											<li>1/4 teaspoon reduced-sodium soy sauce</li>
											<li>1 beef flat iron steak or boneless top sirloin steak
												(3/4 pound)</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- Pick Two -->
				<div class="col-xs-12 col-sm-6 col-md-4">
					<div class="image-flip"
						ontouchstart="this.classList.toggle('hover');">
						<div class="mainflip">
							<div class="frontside">
								<div class="card">
									<div class="card-body text-center">
										<p>
											<img class=" img-fluid"
												src="https://media.giphy.com/media/9UQSRw0BWoJBm/giphy.gif"
												alt="card image">
										</p>
										<h4 class="card-title">Greek Salad</h4>
										<p class="card-text">Delicious! My new favorite salad -
											simple, fresh and wonderful!</p>
										<a href="#" class="btn btn-primary btn-sm"><i
											class="fa fa-plus"></i></a>
									</div>
								</div>
							</div>
							<div class="backside">
								<div class="card">
									<div class="card-body text-center mt-4">
										<h4 class="card-title">Ingredients</h4>
										<ul class="card-text">
											<li>1 hothouse cucumber, unpeeled, seeded, and sliced
												1/4-inch thick</li>
											<li>1 red bell pepper, large-diced</li>
											<li>1 yellow bell pepper, large-diced</li>
											<li>1 pint cherry or grape tomatoes, halved</li>
											<li>1/2 red onion, sliced in half-rounds</li>
											<li>1/2 pound feta cheese, 1/2-inch diced (not crumbled)</li>
											<li>1/2 cup calamata olives, pitted</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-4">
					<div class="image-flip"
						ontouchstart="this.classList.toggle('hover');">
						<div class="mainflip">
							<div class="frontside">
								<div class="card">
									<div class="card-body text-center">
										<p>
											<img class=" img-fluid"
												src="https://media3.giphy.com/media/3ohjUYRegZ09yED22Q/giphy.gif"
												alt="card image">
										</p>
										<h4 class="card-title">Buttery Lemon Grilled Fish on
											Asparagus</h4>
										<p class="card-text">So Easy and delicious! I make This
											once a week.</p>
										<a href="#" class="btn btn-primary btn-sm"><i
											class="fa fa-plus"></i></a>
									</div>
								</div>
							</div>
							<div class="backside">
								<div class="card">
									<div class="card-body text-center mt-4">
										<h4 class="card-title">Ingredients</h4>
										<ul class="card-text">
											<li>asparagus spears (ends trimmed)</li>
											<li>cod filets (4-ounce each, rinsed and patted dry)</li>
											<li>Juice and zest of a medium lemon</li>
											<li>light butter with canola oil</li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<h1 class="text-center">Developed by:</h1>
	</section>
	<div class="row" id="team">
		<div class="col-lg-4 col-md-6 col-sm-12 text-center">
			<a href="https://www.linkedin.com/in/kullen-kee/" target="_blank">
				<img class="rounded-circle" alt="140x140"
				style="width: 140px; height: 140px;"
				src="https://media.licdn.com/dms/image/C5603AQExW_jbu9a9qQ/profile-displayphoto-shrink_200_200/0?e=1578528000&v=beta&t=pe47hQjOPBQCycWAnhuuDnppBQ3jxBstV85lzeuNas8"
				data-holder-rendered="true">
			</a>
			<h3 class="text-dark">Kullen</h3>
		</div>
		<div class="col-lg-4 col-md-6 col-sm-12 text-center">

			<img class="rounded-circle" alt="140x140"
				style="width: 140px; height: 140px;"
				src="https://avatars3.githubusercontent.com/u/49958931?s=460&v=4"
				data-holder-rendered="true">
			<h3 class="text-dark">Vinton</h3>


			<img class="rounded-circle" alt="140x140"
				style="width: 140px; height: 140px;"
				src="https://avatars2.githubusercontent.com/u/53097987?s=460&v=4"
				data-holder-rendered="true"></a>
			<h3 class="text-dark">Travis</h3>
		</div>
		<div class="col-lg-4 col-md-6 col-sm-12 text-center">

			<img class="rounded-circle" alt="140x140"
				style="width: 140px; height: 140px;"
				src="file:///Users/ventus/Downloads/Image%20from%20iOS.jpg"
				data-holder-rendered="true"></a>
			<h3 class="text-dark">Kelly</h3>
		</div>
	</div>
	<div class="row"></div>

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