<template>
	<section class="section">

	<div class="columns">
		<div class="column is-one-fifth">
			<menu-filtros :filtros="filtros" :tags="tags"></menu-filtros>
		</div>
		<div class="column">
			<nav class="breadcrumb" aria-label="breadcrumbs">
				<ul>
					<li><router-link to="/">Eixos</router-link></li>
					<li v-for="breadcrumb of breadcrumbs" class="is-capitalized">
						<router-link :to="breadcrumb.href">{{breadcrumb.nome}}</router-link>
						<!-- <a :href="breadcrumb.href"></a> -->
					</li>
				</ul>
			</nav>

			<cartao v-for="item of shownItems" :key="item.id" :item="item" @click="onSelect(item)"></cartao>
			<div v-if="shownItems.length === 0">Nenhum item corresponde aos filtros.</div>
		</div>
		<div class="column">
			<h1 class="subtitle">Indicadores</h1>
				<div v-for="indicador of shownIndicadores" class="box">
					<b-tooltip :label="indicador.formula" type="is-light" multilined>
						{{indicador.nome}}
					</b-tooltip>
				</div>
		</div>
		<b-loading :active.sync="loading"></b-loading>
	</div>
</section>
</template>

<script>
    export default {

		data() {
			return {
				acoes: [],
				eixos: [],
				filtros: {},
				indicadores: [],
				loading: false,
				programas: [],
				visao: ''
			};
		},

		computed: {

			breadcrumbs() {
				let breadcrumbs = [];
				let path = '';
				for (let param in this.$route.params) {
					let nome = this.$route.params[param].replace(/-/g, ' ');
					path = path.concat('/' + param + '/' + this.$route.params[param]);
					breadcrumbs.push({nome: nome, href: path})
				}
				return breadcrumbs;
			},

			shownItems() {
				if (this.visao === 'eixos') {
					return this.filterEixos();
				} else if (this.visao === 'programas') {
					return this.filterProgramas();
				} else if (this.visao === 'acoes') {
					return this.filterAcoes();
				}
				return [];
			},

			shownIndicadores() {
				return this.filterIndicadores();
			},

			tags() {
				let tags = [];
				this.eixos.forEach(eixo => {
					eixo.tags.forEach(tag => {
						if(tags.indexOf(tag) < 0) tags.push(tag);
					});
				});
				this.programas.forEach(programa => {
					programa.tags.forEach(tag => {
						if(tags.indexOf(tag) < 0) tags.push(tag);
					});
				});
				this.acoes.forEach(acao => {
					acao.tags.forEach(tag => {
						if(tags.indexOf(tag) < 0) tags.push(tag);
					});
				});
				return tags;
			}

		},

        mounted() {
			this.loading = true;

			axios.all([this.getAcoes(), this.getEixos(), this.getIndicadores(), this.getProgramas()])
				.then(axios.spread((acoes, eixos, indicadores, programas) => {
					for (let acao of acoes.data) {
						acao.tags = acao.tags.split('|');
						acao.modais = acao.modais.split('|');
						this.acoes.push(acao);
					}
					for (let eixo of eixos.data) {
						eixo.tags = eixo.tags.split('|');
						eixo.modais = eixo.modais.split('|');
						this.eixos.push(eixo);
					}
					for (let indicador of indicadores.data) {
						indicador.tags = indicador.tags.split('|');
						indicador.modais = indicador.modais.split('|');
						this.indicadores.push(indicador);
					}
					for (let programa of programas.data) {
						programa.tags = programa.tags.split('|');
						programa.modais = programa.modais.split('|');
						this.programas.push(programa);
					}
					this.loading = false;
					this.parseFiltros();
				}));

        },

		methods: {

			filterAcoes() {
				return this.acoes.filter(acao => {
					let matchBusca = true;
					let matchProgramas = true;
					let matchModais = true;
					if(this.filtros['busca']) {
						let objeto = JSON.stringify(acao).toLowerCase();
						let busca = this.filtros['busca'].toLowerCase().trim();
						if(objeto.indexOf(busca) < 0) {
							matchBusca = false;
						}
					}
					if (this.filtros['programas']) {
						matchProgramas = (this.filtros['programas'].indexOf(acao.programa_id) >= 0);
					}
					if(this.filtros['modais']) {
						this.filtros['modais'].forEach(modal => {
							if(acao.modais.indexOf(modal) < 0) {
								matchModais = false;
							}
						});
					}
					return matchBusca && matchProgramas && matchModais;
				});
			},

			filterEixos() {
				return this.eixos.filter(eixo => {
					let matchBusca = true;
					let matchModais = true;
					let matchTags = true;
					if(this.filtros['busca']) {
						let objeto = JSON.stringify(eixo).toLowerCase();
						let busca = this.filtros['busca'].toLowerCase().trim();
						if(objeto.indexOf(busca) < 0) {
							matchBusca = false;
						}
					}
					if(this.filtros['modais']) {
						this.filtros['modais'].forEach(modal => {
							if(eixo.modais.indexOf(modal) < 0) {
								matchModais = false;
							}
						});
					}
					if(this.filtros['tags']) {
						this.filtros['tags'].forEach(tag => {
							if(eixo.tags.indexOf(tag) < 0) {
								matchTags = false;
							}
						});
					}
					return matchBusca && matchModais && matchTags;
				});
			},

			filterIndicadores() {

				return this.indicadores.filter(indicador => {
					let matchBusca = true;
					if(this.filtros['busca']) {
						let objeto = JSON.stringify(indicador).toLowerCase();
						let busca = this.filtros['busca'].toLowerCase().trim();
						if(objeto.indexOf(busca) < 0) {
							matchBusca = false;
						}
					}
					if (this.visao === 'eixos') {
						return matchBusca && (indicador.pai_tipo === 'global');
					}
					else if(this.visao === 'programas') {
						let matchEixos = true;
						if (this.filtros['eixos']) {
							matchEixos = (this.filtros['eixos'].indexOf(indicador.pai_id) >= 0);
						}
						return matchBusca && matchEixos && (indicador.pai_tipo === 'eixo');
					}
					else if(this.visao === 'acoes') {
						let matchPrograma = true;
						if (this.filtros['programas']) {
							matchPrograma = (this.filtros['programas'].indexOf(indicador.pai_id) >= 0);
						}
						return matchBusca && matchPrograma && (indicador.pai_tipo === 'programa');
					}
				});
			},

			filterProgramas() {
				return this.programas.filter(programa => {
					let matchBusca = true;
					let matchEixos = true;
					let matchModais = true;
					if(this.filtros['busca']) {
						let objeto = JSON.stringify(programa).toLowerCase();
						let busca = this.filtros['busca'].toLowerCase().trim();
						if(objeto.indexOf(busca) < 0) {
							matchBusca = false;
						}
					}
					if (this.filtros['eixos']) {
						matchEixos = (this.filtros['eixos'].indexOf(programa.eixo_id) >= 0);
					}
					if(this.filtros['modais']) {
						this.filtros['modais'].forEach(modal => {
							if(programa.modais.indexOf(modal) < 0) {
								matchModais = false;
							}
						});
					}
					return matchBusca && matchEixos && matchModais;
				});
			},

			getAcoes() {
				return axios.get('/acoes');
			},

			getEixos() {
				return axios.get('/eixos');
			},

			getIndicadores() {
				return axios.get('/indicadores');
			},

			getProgramas() {
				return axios.get('/programas');
			},

			onSelect(item) {
				if(this.visao === 'eixos') {
					this.$router.push('/eixo/' + item.chave);
				} else if (this.visao === 'programas') {
					let eixoChave = this.$route.params['eixo'];
					let programaChave = item.chave;
					this.$router.push({ path: `/eixo/${eixoChave}/programa/${programaChave}` });

				}
			},

			parseFiltros() {
				this.filtros = {};
				this.visao = 'eixos';

				if(this.$route.params['eixo']) {
					let index = this.eixos.findIndex(eixo => {
						return eixo.chave === this.$route.params['eixo'];
					});
					if(index >= 0) {
						Vue.set(this.filtros, 'eixos', [this.eixos[index].id]);
						this.visao = 'programas';
					}
				}
				if (this.$route.params['programa']) {
					let index = this.programas.findIndex(programa => {
						return programa.chave === this.$route.params['programa'];
					});
					if(index >= 0) {
						Vue.set(this.filtros, 'programas', [this.programas[index].id]);
						this.visao = 'acoes';
					}
				}

			}

		},

		watch: {
			'$route' (to, from) {
				this.parseFiltros();
			}
		}
    }
</script>

<style scoped>

.capitalize {
	text-transform:capitalize;
}

</style>
