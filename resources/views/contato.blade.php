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
			<div class="columns is-vcentered content">
				<div class="column is-one-third">
					<h2 class="has-text-weight-bold">Entre em contato</h2>
					<p>Qualquer dúvida, envie e-mail para [várias entidades] ou preencha o formulário:</p>
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

					<div class="field is-pulled-right">
						<div class="control">
							<button class="button is-warning">Enviar</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="section notification is-warning is-marginless">
		<div class="container content has-padding-top-200">
			<h1 class="title has-text-centered has-text-weight-bold">Dúvidas frequentes</h1>
			<div class="columns">
				<div class="column is-half">
					<p>
						<h4>O que é a NossaBH?</h4>
						<p>Dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus.</p>
					</p>
					<p>
						<h4>O que é o PlanMob?</h4>
						<p>Dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus.</p>
					</p>
					<p>
						<h4>Lorem ipsum dolor?</h4>
						<p>Dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus.</p>
					</p>
					<p>
						<h4>Sit amet consectetur adipiscing elit nulla accumsam?</h4>
						<p>Dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus.</p>
					</p>
				</div>
				<div class="column is-half">
					<p>
						<h4>O que é a NossaBH?</h4>
						<p>Dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus.</p>
					</p>
					<p>
						<h4>O que é o PlanMob?</h4>
						<p>Dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus.</p>
					</p>
					<p>
						<h4>Lorem ipsum dolor?</h4>
						<p>Dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus.</p>
					</p>
					<p>
						<h4>Sit amet consectetur adipiscing elit nulla accumsam?</h4>
						<p>Dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus.</p>
					</p>
				</div>
			</div>
		</div>
	</section>
@endsection
