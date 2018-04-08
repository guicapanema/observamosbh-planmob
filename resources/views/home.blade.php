@extends('layouts.app')

@section('content')
	<section class="has-text-centered topo-home">
		<div class="titulo-home"><span>Conheça o PlanMob-BH</span></div>
		<img src="/img/home.jpg"></img>
	</section>

	<section class="section notification is-success has-border-ripped">
		<div class="content">
			<div class="columns">
				<div class="column is-8 is-offset-2">
					<h1 class="title has-text-white has-text-weight-bold has-text-centered">O que é um plano de mobilidade?</h1>
					<p>O Plano de Mobilidade é um instrumento de planejamento, obrigatório às cidades com mais de 20.000 habitantes e com outras características, que tem por objetivo efetivar os princípios, diretrizes e objetivos da Política Nacional de Mobilidade Urbana (Lei 12.576/2012). O conteúdo do Plano deve conter, por exemplo, os serviços de transporte público coletivo, a acessibilidade para pessoas com deficiência e restrição de mobilidade, a integração modal e outros tantos elementos.</p>
				</div>
			</div>
		</div>
	</section>

	<section class="section">
		<div class="container content">
			<div class="columns">
				<div class="column is-8 is-offset-2">
					<h1 class="title has-text-weight-bold has-text-centered"><span class="has-underline-dashed-success">O PlanMob-BH</span></h1>
					<p>O PlanMob-BH, foi desenvolvido entre 2007 e 2010. Ele trouxe o desafio de mudança de paradigma em direção à mobilidade urbana sustentável. O PlanMob-BH foi finalizado em agosto de 2010 e apresentado à sociedade em julho de 2011. Com objetivo de melhorar seu conteúdo e conectá-lo ao Plano Diretor, ele foi revisto na IV Conferência de Política Urbana. Com as diretrizes estabelecidas nesse processo, o Plano passou por uma revisão técnica em 2016, no âmbito do Observatório da Mobilidade Urbana. A partir daí, o Plano passou a ter  oito eixos, 23 programas, 175 medidas, metas claras para melhoria da mobilidade e diversos indicadores para acompanhar sua execução para a gestão da demanda e melhoria da oferta, distribuídos em três horizontes temporais (2020, 2025 e 2030).</p>
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
			<div id="eixos">
				<img id="eixos-home" src="/img/eixos.png" usemap="#mapa-eixos"></img>
				<map name="mapa-eixos">
					<area id="cidade-sustentavel" title="CIDADE SUSTENTÁVEL" shape="rect" coords="285,53,430,204" href="/plano/eixo/cidade-sustentavel" alt="Cidade Sustentável" onmouseover="hoverEixo('cidade-sustentavel')" onmouseout="hoverEixo()">
					<area id="mobilidade-coletiva" title="MOBILIDADE COLETIVA" shape="rect" coords="430,133,697,249" href="/plano/eixo/mobilidade-coletiva" alt="Mobilidade Coletiva" onmouseover="hoverEixo('mobilidade-coletiva')" onmouseout="hoverEixo()">
					<area id="individual-motorizada" title="INDIVIDUAL MOTORIZADA" shape="rect" coords="16,220,216,301" href="/plano/eixo/individual-motorizada" alt="Mobilidade Individual Motorizada" onmouseover="hoverEixo('individual-motorizada')" onmouseout="hoverEixo()">
					<area id="logistica-urbana" title="LOGÍSTICA URBANA" shape="rect" coords="252,259,450,375" href="/plano/eixo/logistica-urbana" alt="Logística Urbana" onmouseover="hoverEixo('logistica-urbana')" onmouseout="hoverEixo()">
					<area id="mobilidade-ativa" title="MOBILIDADE ATIVA" shape="rect" coords="715,220,844,355" href="/plano/eixo/mobilidade-ativa" alt="Mobilidade Ativa" onmouseover="hoverEixo('mobilidade-ativa')" onmouseout="hoverEixo()">
					<area id="fiscalizacao-operacao" title="FISCALIZAÇÃO E OPERAÇÃO" shape="rect" coords="839,50,936,203" href="/plano/eixo/fiscalizacao-operacao" alt="Fiscalização e Operação" onmouseover="hoverEixo('fiscalizacao-operacao')" onmouseout="hoverEixo()">
					<area id="acessibilidade-universal" title="ACESSIBILIDADE UNIVERSAL" shape="rect" coords="915,300,1015,415" href="/plano/eixo/acessibilidade-universal" alt="Acessibilidade Universal" onmouseover="hoverEixo('acessibilidade-universal')" onmouseout="hoverEixo()">
					<area id="circulacao-calma" title="CIRCULAÇÃO CALMA" shape="rect" coords="1008,111,1185,333" href="/plano/eixo/circulacao-calma" alt="Circulação Calma" onmouseover="hoverEixo('circulacao-calma')" onmouseout="hoverEixo()">
				</map>
			</div>
		</div>
	</section>

	<section class="section notification is-success is-marginless">
		<div class="content has-padding-top-200">
			<div class="columns">
				<div class="column is-8 is-offset-2">
					<h1 class="title has-text-weight-bold has-text-centered">A Plataforma</h1>
					<p>Esse processo longo e complexo de elaboração e revisões do PlanMob-BH gerou diversos documentos, desde o diagnóstico à lista de ações e seus respectivos valores, tornando difícil a compreensão, apropriação e envolvimento de atores dos mais diversos segmentos sociais com a execução e monitoramento do Plano. A Plataforma tem, então, o objetivo de facilitar o entendimento destes atores sobre o PlanMob-BH, despertar a curiosidade da sociedade sobre seu conteúdo e engajar pessoas, em especial, no monitoramento da implantação do Plano.</p>
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
						<p>Desde que foi criado, em 2008, o Movimento Nossa BH tem se envolvido e tentado dar difusão às discussões, debates e diálogos sobre mobilidade urbana na capital mineira e, mais recentemente, na Região Metropolitana de Belo Horizonte. Nesse sentido, a idealização dessa plataforma tem por fim dar insumos para que mais atores sociais possam se envolver no que diz respeito à mobilidade em Belo Horizonte.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="section notification is-marginless">
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
	</section>

	<div id="tooltip-cidade-sustentavel-eixo" style="display: none">

	</div>

	<div id="tooltip-cidade-sustentavel-programas" style="display: none">
		<div class="content tooltip-content">
			<h4 class="has-text-white has-text-weight-bold">CIDADE SUSTENTÁVEL</h4>
			<h6 class="has-text-white has-text-weight-bold">Programas:</h6>
			<ul>
				<li><a href="/plano/eixo/cidade-sustentavel" class="has-text-white">Programa 1</a></li>
				<li><a href="/plano/eixo/cidade-sustentavel" class="has-text-white">Programa 2</a></li>
			</ul>
		</div>
	</div>
@endsection

@section('scripts')
<script type="text/javascript">
	ImageMap('img[usemap]');

	tippy('area', {
		theme: 'green',
		placement: 'top-start',
		onShow(instance) {
			var offsetArray = $('#' + instance.reference.id).attr('coords').split(',').slice(0,2);
			offsetArray[1] = Number(offsetArray[1]) - instance.reference.clientHeight - 80;
			var offset = offsetArray.join(',');
			instance.options.offset = offset;
		}
	});

</script>
@endsection
