<template>
	<section class="section">

		<nav class="breadcrumb" aria-label="breadcrumbs">
			<ul>
				<li><router-link to="/">O Plano</router-link></li>
				<li v-for="breadcrumb of breadcrumbs" class="is-capitalized">
					<router-link :to="breadcrumb.href">{{breadcrumb.name}}</router-link>
					<!-- <a :href="breadcrumb.href"></a> -->
				</li>
			</ul>
		</nav>
	<div class="columns">
		<div class="column is-one-fifth">
			<filters-menu :filters="filters" :tags="tags"></filters-menu>
		</div>
		<div class="column">
			<h1 v-if="view === 'axes'" class="subtitle">Eixos</h1>
			<h1 v-if="view === 'programs'" class="subtitle">Programas</h1>
			<h1 v-if="view === 'actions'" class="subtitle">Ações</h1>


			<card v-for="item of shownItems" :key="item.id" :item="item" @click="onSelect(item)"></card>
			<div v-if="shownItems.length === 0">Nenhum item corresponde aos filtros.</div>
		</div>
		<div class="column">
			<h1 class="subtitle">Indicadores</h1>
				<div v-for="indicator of shownIndicators" class="box">
					<b-tooltip :label="indicator.formula" type="is-light" multilined>
						{{indicator.name}}
					</b-tooltip>
				</div>
				<div v-if="shownIndicators.length === 0">Nenhum item corresponde aos filtros.</div>

		</div>
		<b-loading :active.sync="loading"></b-loading>
	</div>
</section>
</template>

<script>
    export default {

		data() {
			return {
				actions: [],
				axes: [],
				filters: {},
				indicators: [],
				loading: false,
				programs: [],
				view: ''
			};
		},

		computed: {

			breadcrumbs() {
				let breadcrumbs = [];
				let path = '';
				for (let param in this.$route.params) {
					let name = this.$route.params[param].replace(/-/g, ' ');
					path = path.concat('/' + param + '/' + this.$route.params[param]);
					breadcrumbs.push({name: name, href: path})
				}
				return breadcrumbs;
			},

			shownItems() {
				if (this.view === 'axes') {
					return this.filterAxes();
				} else if (this.view === 'programs') {
					return this.filterPrograms();
				} else if (this.view === 'actions') {
					return this.filterActions();
				}
				return [];
			},

			shownIndicators() {
				return this.filterIndicators();
			},

			tags() {
				let tags = [];
				this.axes.forEach(axis => {
					axis.tags.forEach(tag => {
						if(tags.indexOf(tag) < 0) tags.push(tag);
					});
				});
				this.programs.forEach(program => {
					program.tags.forEach(tag => {
						if(tags.indexOf(tag) < 0) tags.push(tag);
					});
				});
				this.actions.forEach(acao => {
					acao.tags.forEach(tag => {
						if(tags.indexOf(tag) < 0) tags.push(tag);
					});
				});
				return tags;
			}

		},

        mounted() {
			this.loading = true;

			axios.all([this.getActions(), this.getAxes(), this.getIndicators(), this.getPrograms()])
				.then(axios.spread((actions, axes, indicators, programs) => {
					for (let acao of actions.data) {
						acao.tags = acao.tags.split('|');
						acao.modals = acao.modals.split('|');
						this.actions.push(acao);
					}
					for (let axis of axes.data) {
						axis.tags = axis.tags.split('|');
						axis.modals = axis.modals.split('|');
						this.axes.push(axis);
					}
					for (let indicator of indicators.data) {
						indicator.tags = indicator.tags.split('|');
						indicator.modals = indicator.modals.split('|');
						this.indicators.push(indicator);
					}
					for (let program of programs.data) {
						program.tags = program.tags.split('|');
						program.modals = program.modals.split('|');
						this.programs.push(program);
					}
					this.loading = false;
					this.parseFilters();
				}));

        },

		methods: {

			filterActions() {
				return this.actions.filter(acao => {
					let matchSearch = true;
					let matchProgramas = true;
					let matchModais = true;
					if(this.filters['search']) {
						let objeto = JSON.stringify(acao).toLowerCase();
						let search = this.filters['search'].toLowerCase().trim();
						if(objeto.indexOf(search) < 0) {
							matchSearch = false;
						}
					}
					if (this.filters['programs']) {
						matchProgramas = (this.filters['programs'].indexOf(acao.program_id) >= 0);
					}
					if(this.filters['modals']) {
						this.filters['modals'].forEach(modal => {
							if(acao.modals.indexOf(modal) < 0) {
								matchModais = false;
							}
						});
					}
					return matchSearch && matchProgramas && matchModais;
				});
			},

			filterAxes() {
				return this.axes.filter(axis => {
					let matchSearch = true;
					let matchModais = true;
					let matchTags = true;
					if(this.filters['search']) {
						let objeto = JSON.stringify(axis).toLowerCase();
						let search = this.filters['search'].toLowerCase().trim();
						if(objeto.indexOf(search) < 0) {
							matchSearch = false;
						}
					}
					if(this.filters['modals']) {
						this.filters['modals'].forEach(modal => {
							if(axis.modals.indexOf(modal) < 0) {
								matchModais = false;
							}
						});
					}
					if(this.filters['tags']) {
						this.filters['tags'].forEach(tag => {
							if(axis.tags.indexOf(tag) < 0) {
								matchTags = false;
							}
						});
					}
					return matchSearch && matchModais && matchTags;
				});
			},

			filterIndicators() {

				return this.indicators.filter(indicator => {
					let matchSearch = true;
					if(this.filters['search']) {
						let objeto = JSON.stringify(indicator).toLowerCase();
						let search = this.filters['search'].toLowerCase().trim();
						if(objeto.indexOf(search) < 0) {
							matchSearch = false;
						}
					}
					if (this.view === 'axes') {
						return matchSearch && (indicator.parent_type === 'global');
					}
					else if(this.view === 'programs') {
						let matchEixos = true;
						if (this.filters['axes']) {
							matchEixos = (this.filters['axes'].indexOf(indicator.parent_id) >= 0);
						}
						return matchSearch && matchEixos && (indicator.parent_type === 'axis');
					}
					else if(this.view === 'actions') {
						let matchPrograma = true;
						if (this.filters['programs']) {
							matchPrograma = (this.filters['programs'].indexOf(indicator.parent_id) >= 0);
						}
						return matchSearch && matchPrograma && (indicator.parent_type === 'program');
					}
				});
			},

			filterPrograms() {
				return this.programs.filter(program => {
					let matchSearch = true;
					let matchEixos = true;
					let matchModais = true;
					if(this.filters['search']) {
						let objeto = JSON.stringify(program).toLowerCase();
						let search = this.filters['search'].toLowerCase().trim();
						if(objeto.indexOf(search) < 0) {
							matchSearch = false;
						}
					}
					if (this.filters['axes']) {
						matchEixos = (this.filters['axes'].indexOf(program.axis_id) >= 0);
					}
					if(this.filters['modals']) {
						this.filters['modals'].forEach(modal => {
							if(program.modals.indexOf(modal) < 0) {
								matchModais = false;
							}
						});
					}
					return matchSearch && matchEixos && matchModais;
				});
			},

			getActions() {
				return axios.get('/acoes');
			},

			getAxes() {
				return axios.get('/eixos');
			},

			getIndicators() {
				return axios.get('/indicadores');
			},

			getPrograms() {
				return axios.get('/programas');
			},

			onSelect(item) {
				if(this.view === 'axes') {
					this.$router.push('/eixo/' + item.alias);
				} else if (this.view === 'programs') {
					let axisAlias = this.$route.params['eixo'];
					let programAlias = item.alias;
					this.$router.push({ path: `/eixo/${axisAlias}/programa/${programAlias}` });

				}
			},

			parseFilters() {
				this.filters = {};
				this.view = 'axes';

				if(this.$route.params['eixo']) {
					let index = this.axes.findIndex(axis => {
						return axis.alias === this.$route.params['eixo'];
					});
					if(index >= 0) {
						Vue.set(this.filters, 'axes', [this.axes[index].id]);
						this.view = 'programs';
					}
				}
				if (this.$route.params['programa']) {
					let index = this.programs.findIndex(program => {
						return program.alias === this.$route.params['programa'];
					});
					if(index >= 0) {
						Vue.set(this.filters, 'programs', [this.programs[index].id]);
						this.view = 'actions';
					}
				}

			}

		},

		watch: {
			'$route' (to, from) {
				this.parseFilters();
			}
		}
    }
</script>

<style scoped>

.capitalize {
	text-transform:capitalize;
}

</style>
