<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-dark bg-dark">
		<a class="navbar-brand  mr-auto" href="index.do">NOM! Meal Plan
			Architect<span class="sr-only">(current)</span>
		</a>
		<ul class="navbar-nav">

			<!-- Dropdown -->
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> Recipes </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="searchRecipe.do">Search</a> <a
						class="dropdown-item" href="createRecipe.do">Create</a>
				</div></li>
		</ul>
		<form class="form-inline my-2" action="login.do" method="get">
			<button class="btn btn-success btn-sm">Login</button>
		</form>
		<div></div>
		<form class="form-inline my-2" action="register.do" method="get">
			<button class="btn btn-info btn-sm">Register</button>
		</form>
	</nav>
</body>