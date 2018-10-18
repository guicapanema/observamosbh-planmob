@extends('layouts.share')

@section('content')

	<section class="section chart">
		<div class="container has-text-centered">

			<img src="{{ asset('storage/' . $uuid . '.png') }}"></img>

			<div class="buttons has-margin-top-100">
				<a	href="" class="button is-success">

					<b-icon icon="download" size="is-small"></b-icon>
					<span>Conheça o PlanMob BH</span>

				</a>

				<a	href="" class="button is-info is-outlined">

					<b-icon icon="download" size="is-small"></b-icon>
					<span>Monte seu próprio gráfico</span>

				</a>

			</div>
		</div>
	</section>

@endsection
