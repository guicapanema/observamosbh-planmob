<template>
	<section class="section">
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
						if(action.tags) {
							action.tags = action.tags.split('|');
						}
						if(action.modals) {
							action.modals = action.modals.split('|');
						}
						this.actions.push(action);
					}
					for (let axis of axes.data) {
						if(axis.tags) {
							axis.tags = axis.tags.split('|');
						}
						if(axis.modals) {
							axis.modals = axis.modals.split('|');
						}
						this.axes.push(axis);
					}
					for (let indicator of indicators.data) {
						if(indicator.tags) {
							indicator.tags = indicator.tags.split('|');
						}
						if(indicator.modals) {
							indicator.modals = indicator.modals.split('|');
						}
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
					this.$router.push('/busca');
				} else {
					this.$router.push('/');
				}
				this.parsePath();
			},

			parsePath() {
				this.filters = {};
				this.view = 'axes';
				this.listView = false;

				if(this.$route.path === '/busca') {
					this.listView = true;
					if(this.$route.query['tag']) {
						if(typeof this.$route.query['tag'] === 'string') {
							Vue.set(this.filters, 'tags', [this.$route.query['tag']]);
						} else {
							Vue.set(this.filters, 'tags', this.$route.query['tag']);
						}
					}
					if(this.$route.query['modal']) {
						if(typeof this.$route.query['modal'] === 'string') {
							Vue.set(this.filters, 'modals', [this.$route.query['modal']]);
						} else {
							Vue.set(this.filters, 'modals', this.$route.query['modal']);
						}
					}
					if(this.$route.query['search']) {
						Vue.set(this.filters, 'search', this.$route.query['search']);
					}

				} else {
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
				}

			}

		},

		watch: {
			'$route' (to, from) {
				this.parsePath();
			}
		}
    }
</script>

<style scoped>
	section {
		padding-top: 1.5rem;
	}
</style>
