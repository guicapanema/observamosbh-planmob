<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}" class="has-navbar-fixed-top">
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

	<nav class="navbar is-fixed-top
		{{ Request::is('/') ? "is-success" : "" }}
		{{ Request::is('plano*') ? "is-light" : "" }}
		{{ Request::is('indicadores*') ? "is-info" : "" }}
		{{ Request::is('participe*') ? "is-danger" : "" }}
		{{ Request::is('contato*') ? "is-warning" : "" }}">
		<div class="navbar-brand">
			<a class="navbar-item" href="/">
				PlanMob-BH
			</a>
			<div class="navbar-burger burger" data-target="navMenu">
				<span></span>
				<span></span>
				<span></span>
			</div>
		</div>

		<div id="navMenu" class="navbar-menu">
			<div class="navbar-start">
				<a class="navbar-item {{ Request::is('/') ? "is-active" : "" }}" href="/">
					Início
				</a>
				<a class="navbar-item {{ Request::is('plano*') ? "is-active" : "" }}" href="/plano">
					O PlanMob
				</a>
				<a class="navbar-item {{ Request::is('indicadores*') ? "is-active" : "" }}" href="/indicadores">
					Indicadores
				</a>
				<a class="navbar-item {{ Request::is('participe*') ? "is-active" : "" }}" href="/participe">
					Participe
				</a>
				<a class="navbar-item {{ Request::is('contato*') ? "is-active" : "" }}" href="/contato">
					Contato
				</a>
			</div>

			<div class="navbar-end">
				<div class="navbar-item has-dropdown is-hoverable">
					<a class="navbar-link">
						<span class="icon">
							<i class="fas fa-share-alt"></i>
						</span>
						Compartilhe!
					</a>

					<div class="navbar-dropdown is-right">
						<a class="navbar-item" href="https://twitter.com/intent/tweet?text=Conheça o PlanMob-BH!">
							<span class="icon">
								<i class="fab fa-twitter"></i>
							</span>
							Twitter
						</a>
						<a class="navbar-item">
							<span class="icon">
								<i class="fab fa-facebook"></i>
							</span>
							Facebook
						</a>
						<a class="navbar-item">
							<span class="icon">
								<i class="fas fa-envelope-open"></i>
							</span>
							E-mail
						</a>
					</div>
				</div>
			</div>
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
