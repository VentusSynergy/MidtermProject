<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/styles.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container-fluid">
		<a class="navbar-brand" href="index.do"><i class="fas fa-utensils"></i> NOM! Meal Plan Architect</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="login.do">Logout
				</a></li>
				<li class="nav-item"><a class="nav-link" href="register.do">Register
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false">Recipes </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="searchRecipe.do">Search </a> <a
							class="dropdown-item" href="createRecipe.do">Create </a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="mealPlan.do">Meal
						Plan </a>
			</ul>
			<!-- <form:form action="playersByKey.do" method="GET">
					<div class="form-group">
						<label for="key">Team Name, First Name, or Last Name</label> <input
							type="text" name="key" class="form-control"
							placeholder="Enter key word to search">
					</div>
					<button type="submit" class="btn btn-primary btn-block btn-lg">Search</button>
				</form:form> -->
			<form class="form-inline my-2 my-lg-0" action="searchRecipe.do" method="GET">
				<input class="form-control mr-sm-2" name="key" type="search"
					placeholder="Search Recipes" aria-label="Search">
				<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
			</form>
		</div>
	</div>
</nav>
</html>