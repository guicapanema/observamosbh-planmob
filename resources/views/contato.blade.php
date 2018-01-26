@extends('layouts.app')

@section('content')
	<div class="container section">
		<div class="columns content">
			<div class="column">
				<h2 class="has-text-centered">Perguntas frequentes</h2>
				<div>
					<h4>O que é a NossaBH?</h4>
					<p>Dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus.</p>
				</div>
				<div>
					<h4>O que é o PlanMob?</h4>
					<p>Dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus.</p>
				</div>
				<div>
					<h4>Lorem ipsum dolor?</h4>
					<p>Dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus.</p>
				</div>
				<div>
					<h4>Sit amet consectetur adipiscing elit nulla accumsam?</h4>
					<p>Dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus.</p>
				</div>
			</div>
			<div class="column">
				<h2 class="has-text-centered">Entre em contato</h2>
				<p>Qualquer dúvida, envie e-mail para [várias entidades] ou preencha o formulário:</p>
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
					<div class="control has-icons-left">
						<input class="input" type="email" placeholder="Digite seu email">
						<span class="icon is-small is-left">
							<i class="fas fa-envelope"></i>
						</span>
					</div>
				</div>

				<div class="field">
					<label class="label">Mensagem</label>
					<div class="control">
						<textarea class="textarea" placeholder="Digite sua mensagem"></textarea>
					</div>
				</div>

				<div class="field">
					<div class="control">
						<button class="button is-link">Enviar</button>
					</div>
				</div>
			</div>
		</div>
	</div>
@endsection
