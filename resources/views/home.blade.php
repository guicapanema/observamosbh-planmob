@extends('layouts.app')

@section('content')
	<section class="hero is-info is-large home-hero">
		<div class="hero-body">
			<div class="container has-text-centered">
				<h1 class="title">
					Conheça o PlanMob-BH
				</h1>
				<h2 class="subtitle">
					Lorem ipsum dolor sit amet
				</h2>
			</div>
		</div>
	</section>

	<section class="section">
		<div class="content">
			<div class="columns">
				<div class="column is-8 is-offset-2">

					<h1 class="has-text-centered">O que é o PlanMob?</h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
					<h2>Second level</h2>
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

	<section class="section notification">
		<div class="content">
			<h1 class="title has-text-centered">Conheça a estrutura do plano</h1>
			<div class="columns is-vcentered">
				<div class="column is-one-third">
					<div class="notification is-primary has-text-centered">
						<div class="subtitle">Eixos</div>
					</div>
				</div>
				<div class="column is-one-third has-text-centered">
					<div class="notification is-info has-text-centered">
						<div class="subtitle">Programas</div>
					</div>
				</div>
				<div class="column is-one-third has-text-centered">
					<div class="notification is-success has-text-centered">
						<div class="subtitle">Ações</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section>
		<div class="container">
			<div class="columns is-vcentered">
				<div class="column is-3 is-offset-1">
					<h1 class="title">Os eixos da mobilidade em Belo Horizonte</h1>
				</div>
				<div class="column is-6 is-offset-1">
					<img src="/img/cycle.png"></img>
				</div>
			</div>
		</div>
	</section>
@endsection
