<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}" class="has-navbar-fixed-top">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- CSRF Token -->
	<meta name="csrf-token" content="{{ csrf_token() }}">

	<title>{{ config('app.name', 'Laravel') }}</title>

	<meta name="description" content="Conheça, participe e se aproprie do plano de mobilidade de Belo Horizonte!">
	<meta name="keywords" content="Nossa BH,PlanMob,plano,mobilidade,belo horizonte,onibus,metro,bicicleta,pedestre,carro,logistica,cidade,urbano">
	<meta name="author" content="Nossa BH - #ObservamosBH">

	<!-- <link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico"> -->
	<link rel="home" href="https://www.mobilidadebh.org/">

	<meta property="og:site_name" content="{{ config('app.name', 'Laravel') }}">
	<meta property="og:title" content="{{ config('app.name', 'Laravel') }}">
	<meta property="og:description" content="Conheça, participe e se aproprie do plano de mobilidade de Belo Horizonte!">
	<meta property="og:type" content="website">
	<meta property="og:url" content="https://www.mobilidadebh.org/">
	<link rel="canonical" href="https://www.mobilidadebh.org/">

	<!-- Matomo -->
	<script type="text/javascript">
		var _paq = _paq || [];
		/* tracker methods like "setCustomDimension" should be called before "trackPageView" */
		_paq.push(['trackPageView']);
		_paq.push(['enableLinkTracking']);
		(function() {
			var u="//stats.mobilidadebh.org/";
			_paq.push(['setTrackerUrl', u+'piwik.php']);
			_paq.push(['setSiteId', '1']);
			var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
			g.type='text/javascript'; g.async=true; g.defer=true; g.src=u+'piwik.js'; s.parentNode.insertBefore(g,s);
		})();
	</script>
	<!-- End Matomo Code -->

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
			<span class="navbar-item
						{{ Request::is('/') || Request::is('participe*') || Request::is('contato*') ? "navbar-brand-primary" : "" }}
						{{ Request::is('plano*') || Request::is('indicadores*') ? "navbar-brand-danger" : "" }}" href="/">
				<strong>#</strong>OBSERVAMOS<strong>BH</strong>
			</span>
			<a class="navbar-item share-icon is-hidden-desktop" onclick="shareTwitter(event)" href="https://twitter.com/intent/tweet?text=Conheça%2C compreenda e avalie o Plano de Mobilidade Urbana de BH - %E2%80%8B%23PlanMobBH!%20%0Ahttps%3A%2F%2Fmobilidadebh.org%2F%0AVia %40nossabh" target="_blank">
				<span class="icon">
					<i class="fab fa-twitter"></i>
				</span>
			</a>
			<a class="navbar-item share-icon is-hidden-desktop" onclick="shareFacebook(event)" href="https://www.facebook.com/dialog/share?app_id=390669861344505&display=popup&href=https://mobilidadebh.org&redirect_uri=https://mobilidadebh.org" target="_blank">
				<span class="icon">
					<i class="fab fa-facebook"></i>
				</span>
			</a>
			<a class="navbar-item share-icon is-hidden-desktop share-link">
				<span class="icon">
					<i class="fas fa-link"></i>
				</span>
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
				<a class="navbar-item" onclick="shareTwitter(event)" href="https://twitter.com/intent/tweet?text=Conheça%2C compreenda e avalie o Plano de Mobilidade Urbana de BH - %E2%80%8B%23PlanMobBH!%20%0Ahttps%3A%2F%2Fmobilidadebh.org%2F%0AVia %40nossabh">
					<span class="icon">
						<i class="fab fa-twitter"></i>
					</span>
				</a>
				<a class="navbar-item" onclick="shareFacebook(event)" href="https://www.facebook.com/dialog/share?app_id=390669861344505&display=popup&href=&redirect_uri=">
					<span class="icon">
						<i class="fab fa-facebook"></i>
					</span>
				</a>
				<a class="navbar-item share-link">
					<span class="icon">
						<i class="fas fa-link"></i>
					</span>
				</a>
			</div>
		</div>
	</nav>

	@yield('content')

	<footer class="footer">
		<div class="container has-margin-bottom-100">
			<div class="columns">
				<div class="column is-one-quarter is-offset-one-quarter has-text-centered">
					<h5>Realização:</h5>
					<a href="http://nossabh.org.br/" target="_blank"><img src="/img/nossabh-logo.svg" class="nossabh-logo"></img></a>
				</div>
				<div class="column is-one-quarter has-text-centered">
					<h5>Apoio:</h5><br />
					<a href="http://climaesociedade.org/" target="_blank"><img src="/img/ics-logo.png" class="ics-logo"></img></a>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="content has-text-centered">
				<p>
					Código fonte sob licença <a rel="license" href="https://www.gnu.org/licenses/agpl-3.0.html">AGPLv3</a>.
					<a href="https://github.com/guicapanema/observamosbh-planmob"><span class="icon">
						<i class="fab fa-github"></i>
					</span></a>
				</p>
				<p>
					Conteúdo sob licença <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Atribuição 4.0 Internacional</a>.
				</p>
			</div>
		</div>
	</footer>

	<!-- Scripts -->
	<script src="{{ asset('js/app.js') }}"></script>

	@yield('scripts')

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

		var shareFacebook = function(event) {
			var win = window.open('https://www.facebook.com/dialog/share?app_id=390669861344505&display=popup&href=' + encodeURIComponent(window.location.href) + '&redirect_uri=' + encodeURIComponent(window.location.href), '_blank');
			if(win !== null && typeof(win) !== 'undefined') {
				event.preventDefault();
				win.focus();
			}
		};

		var shareLink = new ClipboardJS('.share-link', {
			text: function(trigger) {
				return window.location.href;
			}
		}).on('success', function(e) {
			window.alert('Link copiado!');
		});;

		var shareTwitter = function(event) {
			var text = 'Conheça, compreenda e avalie o Plano de Mobilidade Urbana de BH - ​#PlanMobBH! \n' + window.location.href + '\nVia @nossabh'
			var win = window.open('https://twitter.com/intent/tweet?text=' + encodeURIComponent(text), '_blank');
			if(win !== null && typeof(win) !== 'undefined') {
				event.preventDefault();
				win.focus();
			}
		};
	</script>

</body>
</html>
