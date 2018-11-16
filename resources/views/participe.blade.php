@extends('layouts.app')

@section('content')
	<img src="/img/participe.jpg" style="margin-bottom: -10px" class="top-image"></img>

	<section class="section notification is-light is-marginless has-border-ripped">
		<div class="container">
			<div class="columns content">
				<div class="column is-8 is-offset-2">
					<h1 class="title has-text-weight-bold has-text-centered"><span class="has-underline-dashed-danger">Participe do ObsMob-BH</span></h1>
					<p>O Observatório da Mobilidade Urbana de Belo Horizonte foi pensado no momento de elaboração do PlanMob-BH como um elemento capaz de colocar em diálogo as diversas instituições que se envolvem direta ou indiretamente com a mobilidade urbana de BH.</p>
					<p>Para ser um observador, basta ir a alguma reunião do observatório. Formalmente, a participação é feita via instituição, mas todo cidadão pode comparecer e ter voz. Saiba como participar das discussões do ObsMob-BH: <a href="http://www.bhtrans.pbh.gov.br/observatorio">http://www.bhtrans.pbh.gov.br/observatorio.</a></p>
				</div>
			</div>
		</div>
	</section>

	<section class="section notification is-danger is-marginless">
		<div class="container has-padding-top-200">
			<div class="columns is-multiline content">
				<div class="column is-half">
					<h1 class="has-text-white has-text-weight-bold has-text-centered">COMURB</h1>
					<p>Belo Horizonte possui um Conselho Municipal de Mobilidade Urbana - COMURB. Ele pretende ser um espaço de avaliação, debate e proposição das políticas públicas de mobilidade urbana de Belo Horizonte.</p>
					<p>Entre 2013 e 2017, o Comurb pouco funcionou, com poucas reuniões realizadas e nenhuma deliberação feita ou acatada pela prefeitura. Atualmente, o Comurb passa por um processo de renovação, mas o principal desafio é conseguir dar a esse espaço conteúdo político e poder de deliberação.</p>
				</div>
				<div class="column is-half">
					<h1 class="has-text-white has-text-weight-bold has-text-centered">CRTT</h1>
					<p>As Comissões Regionais de Transportes e Trânsito - CRTTs - foram criadas na década de 1990 como um espaço de discussão de problemas locais da mobilidade urbana: redutores de velocidade, sentido do fluxo das vias, condição dos equipamentos públicos, quadro de horário e itinerário dos ônibus, etc.</p>
					<p>Hoje, existe uma CRTT para cada uma das nove regionais da cidade. Os representantes são eleitos por território de gestão compartilhada e cada regional possui de 4 a 5 territórios, totalizando de 12 a 15 titulares e o mesmo número de suplentes. As requisições de demanda feitas por membros de CRTTs têm prioridade frente às demais, justamente por possuir mais representatividade do território, conferida por eleição. As reuniões das CRTTs são mensais e abertas.</p>
				</div>
				{{-- <div class="column is-half">
					<h1 class="has-text-white has-text-weight-bold has-text-centered">Informe-se</h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
				</div>
				<div class="column is-half">
					<h1 class="has-text-white has-text-weight-bold has-text-centered">Dê um rolé</h1>
					<p>Lorem ipsum<sup><a>[1]</a></sup> dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus. Ut vulputate semper dui. Fusce erat odio, sollicitudin vel erat vel, interdum mattis neque. Sub<sub>script</sub> works as well!</p>
				</div> --}}
			</div>
		</div>
	</section>

	<section class="section has-background-striped-danger">
		<div class="container">
			<div class="columns is-centered content">
				<div class="column is-10 notification is-white has-padding-200">
					<h1 class="has-text-centered">Baixe as fichas-resumo</h1>
					<p>Para contribuir com a discussão sobre cidades, mobilidade urbana, mudanças climáticas e participação social, o Nossa BH produziu quatro fichas-resumo:</p>
					<div class="columns is-mobile">
						<div class="column has-text-centered">
							<a href="http://nossabh.org.br/ficha-1/"><img class="ficha" src="/img/ficha1.png"></img></a>
							<div><a href="http://nossabh.org.br/ficha-1/">Como incidir na política de mobilidade urbana em BH?</a></div>
						</div>
						<div class="column has-text-centered">
							<a href="http://nossabh.org.br/ficha-2/"><img class="ficha" src="/img/ficha2.png"></img></a>
							<div><a href="http://nossabh.org.br/ficha-2/">As mudanças climáticas, a mobilidade urbana e as cidades</a></div>
						</div>
						<div class="column has-text-centered">
							<a href="http://nossabh.org.br/ficha-3/"><img class="ficha" src="/img/ficha3.png"></img></a>
							<div><a href="http://nossabh.org.br/ficha-3/">O Plano de Mobilidade de BH como Instrumento de Gestão Ambiental</a></div>
						</div>
						<div class="column has-text-centered">
							<a href="http://nossabh.org.br/ficha-4/"><img class="ficha" src="/img/ficha4.png"></img></a>
							<div><a href="http://nossabh.org.br/ficha-4/">Como ser observador metropolitano da mobilidade</a></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="section notification is-marginless">
		<div class="container">
			<div class="columns is-vcentered content">
				<div class="column is-one-third">
					<img src="/img/grafismo-rosa.png" class="grafismo is-rotated-180"></img>
					<h2 class="has-text-weight-bold has-margin-top-100">Receba atualizações sobre o PlanMob-BH</h2>
					<p>São enviados no máximo 4 e-mails por ano</p>
					<img src="/img/grafismo-rosa.png" class="grafismo"></img>
				</div>

				<form class="column is-two-thirds" action="https://mailing.horizontes.info/subscribe" method="POST" accept-charset="utf-8">
					{{ csrf_field() }}
					<div class="field">
						<label class="label">Nome</label>
						<div class="control has-icons-left">
							<input class="input" type="text" name="name" id="name" placeholder="Digite seu nome" required>
							<span class="icon is-small is-left">
								<i class="fas fa-user"></i>
							</span>
						</div>
					</div>

					<div class="field">
						<label class="label">Email</label>
						<div class="control has-icons-left ">
							<input class="input{{ Request::query('success') !== null ? ' is-success' : '' }}" type="text" name="email" id="email" placeholder="Digite seu e-mail" required>
							<span class="icon is-small is-left">
								<i class="fas fa-envelope"></i>
							</span>
						</div>
						@if (Request::query('success') !== null)<p class="help is-success">Cadastro realizado com sucesso!</p>@endif
					</div>

					<div style="display:none;">
						<label for="hp">HP</label><br/>
						<input type="text" name="hp" id="hp"/>
					</div>

					<div class="field">
						<div class="control">
							<label class="checkbox">
								<input type="checkbox" name="news" id="news">
								Gostaria de receber novidades do NossaBH</a>
							</label>
						</div>
					</div>

					<input type="hidden" name="list" value="81tAUE7okAjuI9muJ3xt892Q"/>

					<div class="field is-pulled-right">
						<div class="control">
							<button type="submit" class="button is-danger">Cadastrar</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
@endsection
