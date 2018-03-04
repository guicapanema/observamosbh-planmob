@extends('layouts.app')

@section('content')
	<section class="hero is-info is-medium home-hero">
		<div class="hero-body">
			<div class="container has-text-centered">
				{{-- <h1 class="title">
					Conheça o PlanMob-BH
				</h1>
				<h2 class="subtitle">
					Lorem ipsum dolor sit amet
				</h2> --}}
			</div>
		</div>
	</section>

	<section class="section notification is-light is-marginless has-border-ripped">
		<div class="container">
			<div class="columns content">
				<div class="column is-8 is-offset-2">
					<h1 class="title has-text-weight-bold has-text-centered"><span class="has-underline-dashed-danger">Participe do ObsMob-BH</span></h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
				</div>
			</div>
		</div>
	</section>

	<section class="section notification is-danger is-marginless">
		<div class="container has-padding-top-200">
			<div class="columns is-multiline content">
				<div class="column is-half">
					<h1 class="has-text-white has-text-weight-bold has-text-centered">COMURB</h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
				</div>
				<div class="column is-half">
					<h1 class="has-text-white has-text-weight-bold has-text-centered">CRTT</h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
				</div>
				<div class="column is-half">
					<h1 class="has-text-white has-text-weight-bold has-text-centered">Informe-se</h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
				</div>
				<div class="column is-half">
					<h1 class="has-text-white has-text-weight-bold has-text-centered">Dê um rolé</h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
				</div>
			</div>
		</div>
	</section>

	<section class="section has-background-striped-danger">
		<div class="container">
			<div class="columns content">
				<div class="column is-8 is-offset-2 notification is-white">
					<h1 class="has-text-centered">Baixe as fichas-resumo</h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
					<div class="has-text-centered"><a class="button is-danger">Baixar</a></div>
				</div>
			</div>
		</div>
	</section>

	<section class="section notification">
		<div class="container">
			<div class="columns is-vcentered content">
				<div class="column is-one-third">
					<h1>Receba atualizações sobre o PlanMob-BH</h1>
					<p>São enviados no máximo 4 e-mails por ano</p>
				</div>
				<div class="column is-two-thirds">
					<div class="field">
						<label class="label">Nome</label>
						<div class="control has-icons-left">
							<input class="input" type="text" placeholder="Digite seu nome">
							<span class="icon is-small is-left">
								<i class="fas fa-user"></i>
							</span>
						</div>
					</div>

					<div class="field">
						<label class="label">Email</label>
						<div class="control has-icons-left ">
							<input class="input" type="text" placeholder="Digite seu e-mail">
							<span class="icon is-small is-left">
								<i class="fas fa-envelope"></i>
							</span>
						</div>
					</div>

					<div class="field">
						<div class="control">
							<label class="checkbox">
								<input type="checkbox">
								Gostaria de receber novidades da NossaBH</a>
							</label>
						</div>
					</div>

					<div class="field is-pulled-right">
						<div class="control">
							<button class="button is-danger">Cadastrar</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
@endsection
