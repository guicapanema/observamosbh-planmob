@extends('layouts.app')

@section('content')
	<section class="section container">
		<div class="columns content">
			<div class="column">
				<h1 class="has-text-centered">Participe do ObsMob-BH</h1>
				<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
			</div>
			<div class="column">
				<h1 class="has-text-centered">COMURB</h1>
				<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
			</div>
			<div class="column">
				<h1 class="has-text-centered">CRTT</h1>
				<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
			</div>
			<div class="column">
				<h1 class="has-text-centered">Informe-se</h1>
				<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
			</div>
			<div class="column">
				<h1 class="has-text-centered">Dê um rolé</h1>
				<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
			</div>
		</div>
	</section>
	<section class="section notification">
		<div class="container">
			<div class="columns content">
				<div class="column">
					<h1 class="has-text-centered">Baixe as fichas-resumo</h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
					<div class="has-text-centered"><a class="button is-danger">Baixar</a></div>
				</div>
				<div class="column">
					<h1 class="has-text-centered">Receba atualizações sobre o PlanMob-BH</h1>
					<p>São enviados no máximo 4 e-mails por ano</p>
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

					<div class="field is-grouped">
						<div class="control">
							<button class="button is-link">Cadastrar</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
@endsection
