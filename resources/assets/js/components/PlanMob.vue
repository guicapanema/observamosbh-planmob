<template>
	<section class="section">

	<!-- <div class="columns is-mobile">
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
	</div> -->

	<!-- <div class="columns">
		<div class="column is-one-fifth">
			<nav-menu v-if="!listView" :axes="axes" :filters="filters" :programs="programs"></nav-menu>
			<filters-menu v-if="listView" :filters="filters" :tags="tags"></filters-menu>
		</div> -->

		<planmob-columns v-if="!listView"
			:actions="actions"
			:axes="axes"
			:filters="filters"
			:indicators="indicators"
			:programs="programs"
			:view="view"
			@search="onChangeView('list')">
		</planmob-columns>

		<planmob-list v-if="listView"
			:actions="actions"
			:axes="axes"
			:filters="filters"
			:indicators="indicators"
			:programs="programs"
			@column="onChangeView('axes')">
		</planmob-list>

		<b-loading :active.sync="loading"></b-loading>
	<!-- </div> -->
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
				listView: false,
				loading: false,
				programs: [],
				view: ''
			};
		},

		computed: {

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
					this.parsePath();
				}));

        },

		methods: {

			getActions() {
				return axios.get('/api/acoes');
			},

			getAxes() {
				return axios.get('/api/eixos');
			},

			getIndicators() {
				return axios.get('/api/indicadores');
			},

			getPrograms() {
				return axios.get('/api/programas');
			},

			onChangeView(view) {
				if(view === 'list') {
					this.listView = true;
				} else {
					this.listView = false
				}
			},

			parsePath() {
				this.filters = {};
				this.view = 'axes';

				if(this.$route.params['eixo']) {
					let index = this.axes.findIndex(axis => {
						return axis.alias === this.$route.params['eixo'];
					});
					if(index >= 0) {
						Vue.set(this.filters, 'axis', this.axes[index].id);
						this.view = 'programs';
					}
				}
				if (this.$route.params['programa']) {
					let index = this.programs.findIndex(program => {
						return program.alias === this.$route.params['programa'];
					});
					if(index >= 0) {
						Vue.set(this.filters, 'program', this.programs[index].id);
						this.view = 'actions';
					}
				}

				this.onChangeView(this.view);

			}

		},

		watch: {
			'$route' (to, from) {
				this.parsePath();
			}
		}
    }
</script>
