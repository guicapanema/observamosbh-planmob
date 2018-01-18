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
			<a class="navbar-item" href="http://bhtrans.pbh.gov.br">
				<img src="img/logo-planmob.png" alt="Bulma: a modern CSS framework based on Flexbox">
			</a>
			<a class="navbar-item" href="/">
				Início
			</a>
			<a class="navbar-item" href="/plano">
				O PlanMob
			</a>
			<a class="navbar-item" href="https://bulma.io">
				Participe
			</a>
			<a class="navbar-item" href="https://bulma.io">
				Notícias
			</a>
			<a class="navbar-item" href="https://bulma.io">
				Contato
			</a>
		</div>
	</nav>

	<div id="app">
		@yield('content')
	</div>

	<!-- Scripts -->
	<script src="{{ asset('js/app.js') }}"></script>

</body>
</html>
