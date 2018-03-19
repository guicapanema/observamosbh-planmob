@extends('layouts.app')

@section('content')
	<img src="/img/indicadores.jpg" style="margin-bottom: -10px"></img>

	<section class="section notification is-marginless has-border-ripped">
		<div class="content">
			<div class="columns">
				<div class="column is-8 is-offset-2">
					<h1 class="title has-text-centered"><span class="has-underline-dashed-info">A importância de usar indicadores</span></h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
				</div>
			</div>
			<div class="columns">
				<div class="column is-8 is-offset-2">
					<div id="app">
						<chart-wrapper></chart-wrapper>
					</div>
				</div>
			</div>
		</div>

	</section>

	<section class="section notification is-info is-marginless">
		<div class="content has-padding-top-200">
			<div class="columns">
				<div class="column is-8 is-offset-2">
					<h1 class="title has-text-centered">Os indicadores de acompanhamento do PlanMob-BH</h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
				</div>
			</div>
		</div>
	</section>

	<section class="section has-background-striped-info">
		<div class="content">
			<div class="columns">
				<div class="column is-8 is-offset-2 notification is-white has-padding-200">
					<h1 class="has-text-centered">Indicadores apurados pela BHTrans</h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
				</div>
			</div>
		</div>
	</section>

@endsection
