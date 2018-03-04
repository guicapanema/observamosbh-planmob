@extends('layouts.app')

@section('content')
	<section class="has-text-centered">
		<img src="/img/header.png"></img>
	</section>

	<section class="section notification is-success has-border-ripped">
		<div class="content">
			<div class="columns">
				<div class="column is-8 is-offset-2">
					<h1 class="title has-text-white has-text-weight-bold has-text-centered">O que é um plano de mobilidade?</h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
					<h2 class="has-text-white">Second level</h2>
					<p>Curabitur accumsan turpis pharetra <strong>augue tincidunt</strong> blandit. Quisque condimentum maximus mi, sit amet commodo arcu rutrum id. Proin pretium urna vel cursus venenatis. Suspendisse potenti. Etiam mattis sem rhoncus lacus dapibus facilisis. Donec at dignissim dui. Ut et neque nisl.</p>
					<ul>
						<li>In fermentum leo eu lectus mollis, quis dictum mi aliquet.</li>
						<li>Morbi eu nulla lobortis, lobortis est in, fringilla felis.</li>
						<li>Aliquam nec felis in sapien venenatis viverra fermentum nec lectus.</li>
						<li>Ut non enim metus.</li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<section class="section">
		<div class="container content">
			<div class="columns">
				<div class="column is-8 is-offset-2">
					<h1 class="title has-text-weight-bold has-text-centered"><span class="has-underline-dashed-success">O PlanMob-BH</span></h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
				</div>
			</div>
			<div class="columns is-vcentered">
				<div class="column is-one-fifth is-offset-one-fifth">
					<div class="notification is-success has-text-centered">
						<span class="subtitle has-text-weight-bold">Eixos</span>
					</div>
				</div>
				<div class="column is-one-fifth">
					<div class="notification is-warning has-text-centered">
						<span class="subtitle has-text-weight-bold">Programas</span>
					</div>
				</div>
				<div class="column is-one-fifth">
					<div class="notification is-danger has-text-centered">
						<span class="subtitle has-text-weight-bold">Ações</span>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="section notification is-white is-marginless has-border-ripped">
		<div class="container content">
			<h1 class="title has-text-weight-bold has-text-centered">Os eixos da mobilidade em Belo Horizonte</h1>
			<img src="/img/eixos.png"></img>
		</div>
	</section>

	<section class="section notification is-success is-marginless">
		<div class="content has-padding-top-200">
			<div class="columns">
				<div class="column is-8 is-offset-2">
					<h1 class="title has-text-weight-bold has-text-centered">A Plataforma</h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
				</div>
			</div>
		</div>
	</section>

	<section class="section has-background-striped-success">
		<div class="container">
			<div class="content">
				<div class="columns">
					<div class="column is-8 is-offset-2 notification is-white has-padding-200">
						<h1 class="title has-text-weight-bold has-text-centered">Quem idealizou</h1>
						<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer class="footer">
		<div class="container">
			<div class="columns">
				<div class="column is-one-quarter is-offset-one-quarter has-text-centered">
					<h5>Realização:</h5>
					<img src="/img/nossabh-logo.svg" class="nossabh-logo"></img>
				</div>
				<div class="column is-one-quarter has-text-centered">
					<h5>Apoio:</h5><br />
					<img src="/img/ics-logo.png" class="ics-logo"></img>
				</div>

			</div>
		</div>
	</footer>
@endsection
