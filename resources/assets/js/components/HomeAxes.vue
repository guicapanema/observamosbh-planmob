<template>
	<div>
		<div class="buttons is-centered  is-hidden-mobile">
			<a :class="{'button': true,
						'is-large': true,
						'is-success': true,
						'is-focused': homeView === 'axes'}"
				@click="switchView('axes')">Eixos</a>
			<a :class="{'button': true,
						'is-large': true,
						'is-warning': true,
						'is-focused': homeView === 'programs'}"
				@click="switchView('programs')">Programas</a>
			<a :class="{'button': true,
						'is-large': true,
						'is-danger': true,
						'is-focused': homeView === 'actions'}"
				@click="switchView('actions')">Ações</a>
		</div>

		<h1 class="title has-text-weight-bold has-text-centered">Os eixos da mobilidade em Belo Horizonte</h1>
		<h6 v-if="homeView === 'programs'" class="title has-text-centered">NAVEGUE PELOS EIXOS E DESCUBRA OS PROGRAMAS DE CADA UM</h6>
		<h6 v-if="homeView === 'actions'" class="title has-text-centered">AÇÕES POR EIXOS</h6>

		<div id="eixos">
			<img id="eixos-home" src="/img/eixos.png" usemap="#mapa-eixos"></img>
			<map name="mapa-eixos">
				<area id="cidade-sustentavel" title="CIDADE SUSTENTÁVEL" shape="rect" coords="285,53,430,204" href="/plano/eixo/cidade-sustentavel" alt="Cidade Sustentável" @mouseover="hoverAxis('cidade-sustentavel')" @mouseout="hoverAxis()">
				<area id="mobilidade-coletiva" title="MOBILIDADE COLETIVA" shape="rect" coords="430,133,697,249" href="/plano/eixo/mobilidade-coletiva" alt="Mobilidade Coletiva" @mouseover="hoverAxis('mobilidade-coletiva')" @mouseout="hoverAxis()">
				<area id="individual-motorizada" title="INDIVIDUAL MOTORIZADA" shape="rect" coords="16,220,216,301" href="/plano/eixo/individual-motorizada" alt="Mobilidade Individual Motorizada" @mouseover="hoverAxis('individual-motorizada')" @mouseout="hoverAxis()">
				<area id="logistica-urbana" title="LOGÍSTICA URBANA" shape="rect" coords="252,259,450,375" href="/plano/eixo/logistica-urbana" alt="Logística Urbana" @mouseover="hoverAxis('logistica-urbana')" @mouseout="hoverAxis()">
				<area id="mobilidade-ativa" title="MOBILIDADE ATIVA" shape="rect" coords="715,220,844,355" href="/plano/eixo/mobilidade-ativa" alt="Mobilidade Ativa" @mouseover="hoverAxis('mobilidade-ativa')" @mouseout="hoverAxis()">
				<area id="fiscalizacao-operacao" title="FISCALIZAÇÃO E OPERAÇÃO" shape="rect" coords="839,50,936,203" href="/plano/eixo/fiscalizacao-operacao" alt="Fiscalização e Operação" @mouseover="hoverAxis('fiscalizacao-operacao')" @mouseout="hoverAxis()">
				<area id="acessibilidade-universal" title="ACESSIBILIDADE UNIVERSAL" shape="rect" coords="915,300,1015,415" href="/plano/eixo/acessibilidade-universal" alt="Acessibilidade Universal" @mouseover="hoverAxis('acessibilidade-universal')" @mouseout="hoverAxis()">
				<area id="circulacao-calma" title="CIRCULAÇÃO CALMA" shape="rect" coords="1008,111,1185,333" href="/plano/eixo/circulacao-calma" alt="Circulação Calma" @mouseover="hoverAxis('circulacao-calma')" @mouseout="hoverAxis()">
			</map>
		</div>
		<div v-if="homeView === 'actions'" class="columns">
			<div class="column is-flex has-text-danger action-count">
				<div class="has-text-centered has-text-weight-bold">
					<h1 class="is-marginless has-text-danger">65</h1>
					<small>AÇÕES</small>
				</div>
				<img src="/img/grafismo-home.png"></img>
				<div class="has-text-black">permanentes</div>
			</div>
			<div class="column is-flex has-text-danger action-count">
				<div class="has-text-centered has-text-weight-bold">
					<h1 class="is-marginless has-text-danger">74</h1>
					<small>AÇÕES</small>
				</div>
				<img src="/img/grafismo-home.png"></img>
				<div class="has-text-black">Curto<br />Prazo<br />[2020]</div>
			</div>
			<div class="column is-flex has-text-danger action-count">
				<div class="has-text-centered has-text-weight-bold">
					<h1 class="is-marginless has-text-danger">28</h1>
					<small>AÇÕES</small>
				</div>
				<img src="/img/grafismo-home.png"></img>
				<div class="has-text-black">Médio<br />Prazo<br />[2025]</div>
			</div>
			<div class="column is-flex has-text-danger action-count">
				<div class="has-text-centered has-text-weight-bold">
					<h1 class="is-marginless has-text-danger">08</h1>
					<small>AÇÕES</small>
				</div>
				<img src="/img/grafismo-home.png"></img>
				<div class="has-text-black">Longo<br />Prazo<br />[2030]</div>
			</div>
		</div>


		<!-- TOOLTIPS -->
		<!-- programas -->
		<div id="tooltip-cidade-sustentavel-programas" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">CIDADE SUSTENTÁVEL</h4>
				<h6 class="has-text-white has-text-weight-bold">Programas:</h6>
				<ul>
					<li>
						<a href="/plano/eixo/cidade-sustentavel/programa/desenvolvimento-transporte" class="has-text-white">
							Programa Desenvolvimento Orientado para o Transporte
						</a>
					</li>
					<li>
						<a href="/plano/eixo/cidade-sustentavel/programa/qualificacao-ambiental" class="has-text-white">
							Qualificação Ambiental da Mobilidade
						</a>
					</li>
					<li>
						<a href="/plano/eixo/cidade-sustentavel/programa/sistema-viario" class="has-text-white">
							Sistema Viário
						</a>
					</li>
				</ul>
			</div>
		</div>

		<div id="tooltip-mobilidade-coletiva-programas" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">MOBILIDADE COLETIVA</h4>
				<h6 class="has-text-white has-text-weight-bold">Programas:</h6>
				<ul>
					<li>
						<a href="/plano/eixo/mobilidade-coletiva/programa/rede-estruturante" class="has-text-white">
							Rede Estruturante
						</a>
					</li>
					<li>
						<a href="/plano/eixo/mobilidade-coletiva/programa/rede-convencional" class="has-text-white">
							Rede Convencional
						</a>
					</li>
					<li>
						<a href="/plano/eixo/mobilidade-coletiva/programa/rede-complementar" class="has-text-white">
							Rede Complementar
						</a>
					</li>
					<li>
						<a href="/plano/eixo/mobilidade-coletiva/programa/programa-tarifario" class="has-text-white">
							Programa Tarifário
						</a>
					</li>
				</ul>
			</div>
		</div>

		<div id="tooltip-fiscalizacao-operacao-programas" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">GESTÃO, FISCALIZAÇÃO E OPERAÇÃO</h4>
				<h6 class="has-text-white has-text-weight-bold">Programas:</h6>
				<ul>
					<li>
						<a href="/plano/eixo/gestao-fiscalizacao/programa/fiscalizacao-mobilidade" class="has-text-white">
							Fiscalização da Mobilidade
						</a>
					</li>
					<li>
						<a href="/plano/eixo/gestao-fiscalizacao/programa/gestao-planmob" class="has-text-white">
							Gestão do PlanMob-BH
						</a>
					</li>
					<li>
						<a href="/plano/eixo/gestao-fiscalizacao/programa/informacao-mobilidade" class="has-text-white">
							Informação da Mobilidade
						</a>
					</li>
				</ul>
			</div>
		</div>

		<div id="tooltip-circulacao-calma-programas" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">CIRCULAÇÃO CALMA</h4>
				<h6 class="has-text-white has-text-weight-bold">Programas:</h6>
				<ul>
					<li>
						<a href="/plano/eixo/circulacao-calma/programa/programa-seguranca" class="has-text-white">
							Programa de Segurança
						</a>
					</li>
					<li>
						<a href="/plano/eixo/circulacao-calma/programa/humanizacao-transito" class="has-text-white">
							Humanização do Trânsito e Promoção do Convívio no Espaço Público
						</a>
					</li>
					<li>
						<a href="/plano/eixo/circulacao-calma/programa/educacao-mobilidade" class="has-text-white">
							Educação para A Mobilidade
						</a>
					</li>
				</ul>
			</div>
		</div>

		<div id="tooltip-acessibilidade-universal-programas" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">ACESSIBILIDADE UNIVERSAL</h4>
				<h6 class="has-text-white has-text-weight-bold">Programas:</h6>
				<ul>
					<li>
						<a href="/plano/eixo/acessibilidade-universal/programa/acessibilidade-transporte-publico" class="has-text-white">
							Acessibilidade no Transporte Público Coletivo
						</a>
					</li>
					<li>
						<a href="/plano/eixo/acessibilidade-universal/programa/acessibilidade-calcadas" class="has-text-white">
							Acessibilidade em Calçadas e Travessias
						</a>
					</li>
					<li>
						<a href="/plano/eixo/acessibilidade-universal/programa/inclusao-social" class="has-text-white">
							Inclusão Social
						</a>
					</li>
				</ul>
			</div>
		</div>

		<div id="tooltip-mobilidade-ativa-programas" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">MOBILIDADE ATIVA</h4>
				<h6 class="has-text-white has-text-weight-bold">Programas:</h6>
				<ul>
					<li>
						<a href="/plano/eixo/mobilidade-ativa/programa/bh-a-pe" class="has-text-white">
							BH a Pé
						</a>
					</li>
					<li>
						<a href="/plano/eixo/mobilidade-ativa/programa/pedala-bh" class="has-text-white">
							Pedala BH
						</a>
					</li>
				</ul>
			</div>
		</div>

		<div id="tooltip-logistica-urbana-programas" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">LOGÍSTICA URBANA</h4>
				<h6 class="has-text-white has-text-weight-bold">Programas:</h6>
				<ul>
					<li>
						<a href="/plano/eixo/logistica-urbana/programa/entregando-melhor" class="has-text-white">
							Circulando e Entregando Melhor
						</a>
					</li>
					<li>
						<a href="/plano/eixo/logistica-urbana/programa/cooperando-abastecimento" class="has-text-white">
							Cooperando com o Abastecimento da Cidade
						</a>
					</li>
				</ul>
			</div>
		</div>

		<div id="tooltip-individual-motorizada-programas" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">MOBILIDADE INDIVIDUAL MOTORIZADA</h4>
				<h6 class="has-text-white has-text-weight-bold">Programas:</h6>
				<ul>
					<li>
						<a href="/plano/eixo/individual-motorizada/programa/racionalizacao-individual" class="has-text-white">
							Racionalização do Uso do Transporte Individual Privado
						</a>
					</li>
					<li>
						<a href="/plano/eixo/individual-motorizada/programa/publico-individual" class="has-text-white">
							Transporte Público Individual
						</a>
					</li>
					<li>
						<a href="/plano/eixo/individual-motorizada/programa/estacionamento" class="has-text-white">
							Estacionamento
						</a>
					</li>
				</ul>
			</div>
		</div>

		<!-- ações -->

		<div id="tooltip-cidade-sustentavel-acoes" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">CIDADE SUSTENTÁVEL</h4>
				<h6 class="has-text-white has-text-weight-bold">10 ações</h6>
			</div>
		</div>

		<div id="tooltip-mobilidade-coletiva-acoes" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">MOBILIDADE COLETIVA</h4>
				<h6 class="has-text-white has-text-weight-bold">36 ações</h6>
			</div>
		</div>

		<div id="tooltip-fiscalizacao-operacao-acoes" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">GESTÃO, FISCALIZAÇÃO E OPERAÇÃO</h4>
				<h6 class="has-text-white has-text-weight-bold">34 ações</h6>
			</div>
		</div>

		<div id="tooltip-circulacao-calma-acoes" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">CIRCULAÇÃO CALMA</h4>
				<h6 class="has-text-white has-text-weight-bold">25 ações</h6>
			</div>
		</div>

		<div id="tooltip-acessibilidade-universal-acoes" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">ACESSIBILIDADE UNIVERSAL</h4>
				<h6 class="has-text-white has-text-weight-bold">14 ações</h6>
			</div>
		</div>

		<div id="tooltip-mobilidade-ativa-acoes" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">MOBILIDADE ATIVA</h4>
				<h6 class="has-text-white has-text-weight-bold">16 ações</h6>
			</div>
		</div>

		<div id="tooltip-logistica-urbana-acoes" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">LOGÍSTICA URBANA</h4>
				<h6 class="has-text-white has-text-weight-bold">15 ações</h6>
			</div>
		</div>

		<div id="tooltip-individual-motorizada-acoes" style="display: none">
			<div class="content tooltip-content">
				<h4 class="has-text-white has-text-weight-bold">MOBILIDADE INDIVIDUAL MOTORIZADA</h4>
				<h6 class="has-text-white has-text-weight-bold">22 ações</h6>
			</div>
		</div>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				homeView: 'axes',
				actionsTippy: null,
				axesTippy: null,
				programasTippy: null
			};
		},

		mounted() {
			ImageMap('img[usemap]');
			this.axesTippy = tippy('area', {
				theme: 'success',
				placement: 'top-start',
				onShow(instance) {
					var offsetArray = $('#' + instance.reference.id).attr('coords').split(',').slice(0,2);
					if (navigator.userAgent.indexOf("Firefox") > 0) {
						offsetArray[1] = Number(offsetArray[1]) - instance.reference.clientHeight - 80;
						var offset = offsetArray.join(',');
						instance.options.offset = offset;
					}
				}
			});
		},

		methods: {
			hoverAxis (axis) {
				if(!axis) {
					$('#eixos-home').attr('src', '/img/eixos.png');
				} else {
					$('#eixos-home').attr('src', '/img/eixos-' + axis + '.png');
				}
			},

			switchView (view) {
				this.homeView = view;
				if (this.actionsTippy) this.actionsTippy.destroyAll();
				if (this.axesTippy) this.axesTippy.destroyAll();
				if (this.programsTippy) this.programsTippy.destroyAll();

				if(view === 'axes') {
					this.axesTippy = tippy('area', {
						theme: 'success',
						placement: 'top-start',
						touchHold: true,
						onShow(instance) {
							let offsetArray = $('#' + instance.reference.id).attr('coords').split(',').slice(0,2);
							if (navigator.userAgent.indexOf("Firefox") > 0) {
								offsetArray[1] = Number(offsetArray[1]) - instance.reference.clientHeight - 80;
								let offset = offsetArray.join(',');
								instance.options.offset = offset;
							}
						}
					});
				} else if (view === 'programs') {
					this.programsTippy = tippy('area', {
						theme: 'warning',
						placement: 'top-start',
						interactive: true,
						dynamicTitle: true,
						onShow(instance) {
							let offsetArray = $('#' + instance.reference.id).attr('coords').split(',').slice(0,2);
							if (navigator.userAgent.indexOf("Firefox") > 0) {
								offsetArray[1] = Number(offsetArray[1]) - instance.reference.clientHeight - 150;
								let offset = offsetArray.join(',');
								instance.options.offset = offset;
							}
							instance.reference.setAttribute('previousTitle', instance.reference.getAttribute('data-original-title'));
							let tooltipHtml = document.getElementById('tooltip-' + instance.reference.id + '-programas').innerHTML;
							instance.reference.setAttribute('title', tooltipHtml);
						},
						onHide(instance) {
							instance.reference.setAttribute('title', instance.reference.getAttribute('previousTitle'));
						}
					});
				} else if (view === 'actions') {
						this.actionsTippy = tippy('area', {
							theme: 'danger',
							placement: 'top-start',
							dynamicTitle: true,
							onShow(instance) {
								let offsetArray = $('#' + instance.reference.id).attr('coords').split(',').slice(0,2);
								if (navigator.userAgent.indexOf("Firefox") > 0) {
									offsetArray[1] = Number(offsetArray[1]) - instance.reference.clientHeight - 80;
									let offset = offsetArray.join(',');
									instance.options.offset = offset;
								}
								instance.reference.setAttribute('previousTitle', instance.reference.getAttribute('data-original-title'));
								let tooltipHtml = document.getElementById('tooltip-' + instance.reference.id + '-acoes').innerHTML;
								instance.reference.setAttribute('title', tooltipHtml);
							},
							onHide(instance) {
								instance.reference.setAttribute('title', instance.reference.getAttribute('previousTitle'));
							}
						});
				}
			}
		}
	}
</script>

<style scoped>
.action-count {
	align-items: center;
	justify-content: center;
}
.action-count img {
	height: 3rem;
	margin: 0 0.2rem;
}
</style>
