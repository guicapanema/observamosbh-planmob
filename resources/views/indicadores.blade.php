@extends('layouts.app')

@section('content')
	<img src="/img/indicadores.jpg" style="margin-bottom: -10px" class="top-image"></img>

	<div id="app">
		<section class="section notification is-marginless has-border-ripped">
			<div class="content">
				<div class="columns">
					<div class="column is-8 is-offset-2">
						<h1 class="title has-text-centered"><span class="has-underline-dashed-info">A importância de usar indicadores</span></h1>
						<p>O uso de indicadores contribui no acompanhamento e monitoramento da execução de planos, políticas e medidas. Ao se valer de um conjunto de indicadores, a sociedade tem a possibilidade de compreender melhor a efetividade dos instrumentos de gestão disponíveis a ela: Plano, políticas, medidas. Além disso, eles podem trazer informações sobre uso de  recursos humanos, financeiros e materiais, sobre o cumprimento de normas, ajudam a analisar  tendências e contribuem, também, com a investigação científica sobre assuntos diversos.</p>
					</div>
				</div>

				<indicators></indicators>

			</div>
		</section>

		<section class="section notification is-info is-marginless">
			<div class="content has-padding-top-200">
				<div class="columns">
					<div class="column is-8 is-offset-2">
						<h1 class="title has-text-centered">Os indicadores de acompanhamento do PlanMob-BH</h1>
						<p>O PlanMobBH possui quatro níveis de indicadores:</p>
						<ol>
							<li>Indicadores para cada um dos seis Objetivos Estratégicos do Plano;</li>
							<li>Indicadores gerais para se avaliar o Plano;</li>
							<li>Indicadores que avaliam cada um dos oito Eixos do Plano;</li>
							<li>Indicadores que avaliam os 23 Programas do Plano.</li>
						</ol>
						<p>Além desses, o Plano de Mobilidade Urbana de Belo Horizonte possui um Indicador Geral do Plano: <strong>Índice de Cumprimento das Metas (ICM) estabelecidas no PlanMob-BH 2030.</strong></p>
						<p>Ele tem por objetivo a avaliar permanentemente o efetivo cumprimento das metas estabelecidas em todos os eixos que integram o PlanMob-BH.</p>
						<p>Esses quatro níveis mais o Indicador Geral, cruzados entre si e inseridos nos os horizontes de curto (2020), médio (2025) e longo prazo (2030) permitirão à Prefeitura de Belo Horizonte e à sociedade em geral acompanhar dinamicamente a execução do Plano de Mobilidade e propor, periodicamente, sua revisão, com base nos resultados apurados pelos indicadores do Plano, dos Eixos e dos Programas.</p>
					</div>
				</div>
			</div>
		</section>

		<section class="section has-background-striped-info">
			<div class="content">
				<div class="columns">
					<div class="column is-8 is-offset-2 notification is-white has-padding-200">
						<h1 class="has-text-centered">Indicadores apurados pela BHTrans</h1>
						<p>Atualmente, o PlanMobBH possui 107 indicadores de desempenho que foram discutidos no âmbito do Observatório da Mobilidade Urbana de Belo Horizonte e que contribuem para o monitoramento do Plano.</p>

						<p>Após a publicação de três edições do Balanço da Mobilidade Urbana, identificou-se a necessidade de revisar, de forma participativa, os indicadores de acompanhamento do Plano e o formato do Balanço, de maneira a torná-lo mais efetivo na avaliação da implementação do PlanMob-BH. Desse processo de revisão, que durou quase dois anos, chegou-se aos 107 indicadores.</p>
						<p>Para compreender melhor sobre o processo de revisão, acesse o documento <a href="http://itdpbrasil.org.br/revisao-dos-indicadores-bh/">Revisão dos indicadores do Balanço Anual de Mobilidade Urbana de Belo Horizonte 2016 (ano-base 2015).</a></p>
					</div>
				</div>
			</div>
		</section>
	</div>

@endsection
