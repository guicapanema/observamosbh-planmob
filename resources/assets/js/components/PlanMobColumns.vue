<template>
	<div class="columns">
		<div class="column is-one-fifth">
			<nav-menu :axes="axes" :filters="filters" :programs="programs" @search="onSearch()"></nav-menu>
		</div>

		<div class="column">
			<template v-if="view === 'axes'">
				<h1 class="subtitle">Eixos</h1>
				<item-card v-for="item of filteredAxes" :key="'axis' + item.id" :item="item" @click="onSelect(item, 'axis')"></item-card>
				<div v-if="!filteredAxes || filteredAxes.length === 0">Nenhum item corresponde aos filtros.</div>
			</template>
			<template v-if="view === 'programs'">
				<h1 class="subtitle"><router-link to="/">Eixos</router-link> / {{ axes.find(axis => axis.id === filters['axis']).name }}</h1>
				<item-card v-for="item of filteredPrograms" :key="'program' + item.id" :item="item" @click="onSelect(item, 'program')"></item-card>
				<div v-if="!filteredPrograms || filteredPrograms.length === 0">Nenhum item corresponde aos filtros.</div>
			</template>
			<template v-if="view === 'actions'">
				<h1 class="subtitle">
					<router-link to="/">Eixos</router-link> / <router-link :to="'/eixo/' + axes.find(axis => axis.id === filters['axis']).alias">{{ axes.find(axis => axis.id === filters['axis']).name }}</router-link> / {{ programs.find(program => program.id === filters['program']).name }}
				</h1>
				<item-card v-for="item of filteredActions" :key="'action' + item.id" :item="item"></item-card>
				<div v-if="!filteredActions || filteredActions.length === 0">Nenhum item corresponde aos filtros.</div>
			</template>
		</div>

		<div class="column">
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
	</div>
</template>

<script>
    export default {

		props: ['actions', 'axes', 'filters', 'indicators', 'programs', 'view'],

		data() {
			return {
			};
		},

		computed: {

			filteredActions() {
				return this.actions.filter(action => {
					return this.filters['program'] === action.program_id;
				});
			},

			filteredAxes() {
				return this.axes.filter(axis => {
					let matchModals = true;
					if(this.filters['modals']) {
						this.filters['modals'].forEach(modal => {
							if(axis.modals.indexOf(modal) < 0) {
								matchModals = false;
							}
						});
					}
					return matchModals;
				});
			},

			filteredIndicators() {
				return this.indicators.filter(indicator => {
					if(this.listView) {
						return matchSearch;
					}
					if (this.view === 'axes') {
						return (indicator.parent_type === 'global');
					}
					if(this.view === 'programs') {
						let matchAxis = this.filters['axis'] === indicator.parent_id;
						return matchAxis && (indicator.parent_type === 'App\\Axis');
					}
					if(this.view === 'actions') {
						let matchProgram = this.filters['program'] === indicator.parent_id;
						return matchProgram && (indicator.parent_type === 'App\\Program');
					}
				});
			},

			filteredPrograms() {
				return this.programs.filter(program => {
					let matchAxis = this.filters['axis'] === program.axis_id;;
					let matchModals = true;
					if(this.filters['modals']) {
						this.filters['modals'].forEach(modal => {
							if(program.modals.indexOf(modal) < 0) {
								matchModals = false;
							}
						});
					}
					return matchAxis && matchModals;
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
        },

		methods: {

			onSearch() {
				this.$emit('search');
			},

			onSelect(item, type) {
				if(type === 'axis') {
					this.$router.push('/eixo/' + item.alias);
				} else if (type === 'program') {
					let axisAlias = this.axes.find(axis => {
						return axis.id === item.axis_id;
					}).alias;
					let programAlias = item.alias;
					this.$router.push({ path: `/eixo/${axisAlias}/programa/${programAlias}` });
				}
			}

		}
    }
</script>

<style scoped>

.view-button {
	cursor: pointer;
}

</style>
