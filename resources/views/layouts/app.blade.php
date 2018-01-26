<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- CSRF Token -->
	<meta name="csrf-token" content="{{ csrf_token() }}">

	<title>{{ config('app.name', 'Laravel') }}</title>

	<!-- Styles -->
	<link href="{{ asset('css/app.css') }}" rel="stylesheet">

	<link href="https://use.fontawesome.com/releases/v5.0.3/css/all.css" rel="stylesheet">
</head>
<body>
	<nav class="navbar is-light" role="navigation" aria-label="main navigation">
		<div class="navbar-brand">
			<a class="navbar-item" href="/">
				<img src="/img/logo-planmob.png" alt="Bulma: a modern CSS framework based on Flexbox">
			</a>
			<button class="button navbar-burger" data-target="navMenu">
				<span></span>
				<span></span>
				<span></span>
			</button>
		</div>
		<div class="navbar-menu" id="navMenu">
			<a class="navbar-item" href="/">
				Início
			</a>
			<a class="navbar-item" href="/plano">
				O PlanMob
			</a>
			<a class="navbar-item" href="/indicadores">
				Indicadores
			</a>
			<a class="navbar-item" href="/participe">
				Participe
			</a>
			<a class="navbar-item" href="/contato">
				Contato
			</a>
		</div>
	</nav>

	@yield('content')

	<!-- Scripts -->
	<script src="{{ asset('js/app.js') }}"></script>

	<script>
		document.addEventListener('DOMContentLoaded', function () {

			// Get all "navbar-burger" elements
			var $navbarBurgers = Array.prototype.slice.call(document.querySelectorAll('.navbar-burger'), 0);

			// Check if there are any navbar burgers
			if ($navbarBurgers.length > 0) {

				// Add a click event on each of them
				$navbarBurgers.forEach(function ($el) {
					$el.addEventListener('click', function () {

						// Get the target from the "data-target" attribute
						var target = $el.dataset.target;
						var $target = document.getElementById(target);

						// Toggle the class on both the "navbar-burger" and the "navbar-menu"
						$el.classList.toggle('is-active');
						$target.classList.toggle('is-active');

					});
				});
			}

		});
	</script>

</body>
</html>
