<template>
	<section class="section">

	<div class="columns is-mobile">
		<div class="column is-two-thirds">
			<nav v-if="!listView" class="breadcrumb" aria-label="breadcrumbs">
				<ul>
					<li><router-link to="/">O Plano</router-link></li>
					<li v-for="breadcrumb of breadcrumbs" class="is-capitalized">
						<router-link :to="breadcrumb.href">{{breadcrumb.name}}</router-link>
					</li>
				</ul>
			</nav>
		</div>
		<div class="column is-one-third">
			<div class="is-pulled-right">
				<b-tooltip label="Visão em colunas" type="is-light" position="is-left">
					<div class="view-button margin-right-100" @click="onChangeView('column')">
						<b-icon icon="columns" :type="listView ? 'is-dark' : 'is-info'"></b-icon>
					</div>
				</b-tooltip>
				<b-tooltip label="Visão em lista" type="is-light" position="is-left">
					<div class="view-button" @click="onChangeView('list')">
						<b-icon icon="list-ul" :type="listView ? 'is-info' : 'is-dark'" ></b-icon>
					</div>
				</b-tooltip>
			</div>
		</div>
	</div>

	<div class="columns">
		<div class="column is-one-fifth">
			<filters-menu :filters="filters" :tags="tags"></filters-menu>
		</div>

		<div class="column">
			<template v-if="listView || view === 'axes'">
				<h1  class="subtitle">Eixos</h1>
				<item-card v-for="item of filteredAxes" :key="'axis' + item.id" :item="item" @click="onSelect(item, 'axis')"></item-card>
				<div v-if="!filteredAxes || filteredAxes.length === 0">Nenhum item corresponde aos filtros.</div>
			</template>
			<template v-if="listView || view === 'programs'">
				<h1 class="subtitle">Programas</h1>
				<item-card v-for="item of filteredPrograms" :key="'program' + item.id" :item="item" @click="onSelect(item, 'program')"></item-card>
				<div v-if="!filteredPrograms || filteredPrograms.length === 0">Nenhum item corresponde aos filtros.</div>
			</template>
			<template v-if="listView || view === 'actions'">
				<h1 class="subtitle">Ações</h1>
				<item-card v-for="item of filteredActions" :key="'action' + item.id" :item="item" @click="onSelect(item, 'action')"></item-card>
				<div v-if="!filteredActions || filteredActions.length === 0">Nenhum item corresponde aos filtros.</div>
			</template>
			<template v-if="listView">
				<h1 class="subtitle">Indicadores</h1>
				<div v-for="indicator of filteredIndicators" class="box">
					<b-tooltip :label="indicator.formula" type="is-light" multilined>
						{{indicator.name}}
					</b-tooltip>
				</div>
				<div v-if="!filteredIndicators || filteredIndicators.length === 0">Nenhum item corresponde aos filtros.</div>
			</template>
		</div>
		<div v-if="!listView" class="column">
			<h1 class="subtitle">Indicadores</h1>
			<div v-for="indicator of filteredIndicators" class="box">
				<b-tooltip :label="indicator.formula" type="is-light" multilined>
					<div>
						<div class="columns">
							<div class="column">
								<strong>{{indicator.name}}</strong><br />
								{{indicator.description}}
							</div>
						</div>
						<div class="columns is-size-7">
							<div class="column">
								Curto prazo: metaX
							</div>
							<div class="column">
								Médio prazo: metaX
							</div>
							<div class="column">
								Longo prazo: metaX
							</div>
						</div>
					</div>
				</b-tooltip>
			</div>
			<div v-if="!filteredIndicators || filteredIndicators.length === 0">Nenhum item corresponde aos filtros.</div>
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
				view: '',
				filters: {},
				indicators: [],
				listView: false,
				loading: false,
				programs: []
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

			filteredActions() {
				return this.actions.filter(action => {
					let matchSearch = true;
					let matchProgramas = true;
					let matchModais = true;
					if(this.filters['search']) {
						let objeto = JSON.stringify(action).toLowerCase();
						let search = this.filters['search'].toLowerCase().trim();
						if(objeto.indexOf(search) < 0) {
							matchSearch = false;
						}
					}
					if (this.filters['programs']) {
						matchProgramas = (this.filters['programs'].indexOf(action.program_id) >= 0);
					}
					if(this.filters['modals']) {
						this.filters['modals'].forEach(modal => {
							if(action.modals.indexOf(modal) < 0) {
								matchModais = false;
							}
						});
					}
					return matchSearch && matchProgramas && matchModais;
				});
			},

			filteredAxes() {
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

			filteredIndicators() {

				return this.indicators.filter(indicator => {
					let matchSearch = true;
					if(this.filters['search']) {
						let objeto = JSON.stringify(indicator).toLowerCase();
						let search = this.filters['search'].toLowerCase().trim();
						if(objeto.indexOf(search) < 0) {
							matchSearch = false;
						}
					}
					if(this.listView) {
						return matchSearch;
					}
					if (this.view === 'axes') {
						return matchSearch && (indicator.parent_type === 'global');
					}
					if(this.view === 'programs') {
						let matchEixos = true;
						if (this.filters['axes']) {
							matchEixos = (this.filters['axes'].indexOf(indicator.parent_id) >= 0);
						}
						return matchSearch && matchEixos && (indicator.parent_type === 'axis');
					}
					if(this.view === 'actions') {
						let matchPrograma = true;
						if (this.filters['programs']) {
							matchPrograma = (this.filters['programs'].indexOf(indicator.parent_id) >= 0);
						}
						return matchSearch && matchPrograma && (indicator.parent_type === 'program');
					}
				});
			},

			filteredPrograms() {
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
					for (let action of actions.data) {
						action.tags = action.tags.split('|');
						action.modals = action.modals.split('|');
						this.actions.push(action);
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

			onSelect(item, type) {
				if(this.listView) {
					return;
				}
				if(type === 'axis') {
					this.$router.push('/eixo/' + item.alias);
				} else if (type === 'program') {
					let axisAlias = this.axes.find(axis => {
						return axis.id === item.axis_id;
					}).alias;
					let programAlias = item.alias;
					this.$router.push({ path: `/eixo/${axisAlias}/programa/${programAlias}` });
				}
			},

			onChangeView(view) {
				if(view === 'list') {
					this.listView = true;
				} else {
					this.listView = false
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

.view-button {
	cursor: pointer;
}

.margin-right-100 {
	margin-right: 1em;
}


</style>
