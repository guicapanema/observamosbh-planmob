<template>
	<div class="columns">
		<div class="column is-one-fifth">
			<nav-menu :axes="axes" :filters="filters" :programs="programs" @search="onSearch()"></nav-menu>
		</div>

		<div class="column">
			<div class="columns">
				<div class="column">
					<template v-if="view === 'axes'">
						<h1 class="subtitle has-text-grey">Eixos</h1>
					</template>
					<template v-if="view === 'programs'">
						<div class="is-flex">
							<figure class="axis-container is-flex flex-bottom"><img :src="axes.find(axis => axis.id === filters['axis']).image" class="flex-bottom"></img></figure>
							<div class="flex-bottom">
								<router-link to="/" class="has-text-grey">Eixos</router-link><br />
								<h1 class="subtitle"><span class="has-text-success">{{ axes.find(axis => axis.id === filters['axis']).name }}</span></h1>
							</div>
						</div>
					</template>
					<template v-if="view === 'actions'">
						<div class="is-flex">
							<figure class="axis-container is-flex flex-bottom"><img :src="axes.find(axis => axis.id === filters['axis']).image" class="flex-bottom"></img></figure>
							<div class="flex-bottom">
								<router-link to="/" class="has-text-grey">Eixos</router-link> / <router-link :to="'/eixo/' + axes.find(axis => axis.id === filters['axis']).alias" class="has-text-success">{{ axes.find(axis => axis.id === filters['axis']).name }}</router-link><br />
								<h1 class="subtitle"><span class="has-text-warning">{{ programs.find(program => program.id === filters['program']).name }}</span></h1>
							</div>
						</div>
					</template>
				</div>
				<div class="column is-flex is-hidden-mobile">
					<h1 class="subtitle flex-bottom">Indicadores</h1>
				</div>
			</div>
			<div class="columns">
				<div class="column">
					<template v-if="view === 'axes'">
						<item-card v-for="item of filteredAxes" :key="'axis' + item.id" :item="item" @click="onSelect(item, 'axis')"></item-card>
						<div v-if="!filteredAxes || filteredAxes.length === 0">Nenhum item corresponde aos filtros.</div>
					</template>
					<template v-if="view === 'programs'">
						<item-card v-for="item of filteredPrograms" :key="'program' + item.id" :item="item" @click="onSelect(item, 'program')"></item-card>
						<div v-if="!filteredPrograms || filteredPrograms.length === 0">Nenhum item corresponde aos filtros.</div>
					</template>
					<template v-if="view === 'actions'">
						<item-card v-for="item of filteredActions" :key="'action' + item.id" :item="item"></item-card>
						<div v-if="!filteredActions || filteredActions.length === 0">Nenhum item corresponde aos filtros.</div>
					</template>
				</div>
				<div class="column">
					<h1 class="subtitle is-hidden-tablet">Indicadores</h1>

					<indicator-card
						v-for="indicator of filteredIndicators"
						:key="'indicator-' + indicator.id"
						:indicator="indicator">
					</indicator-card>

					<div v-if="!filteredIndicators || filteredIndicators.length === 0">Nenhum item corresponde aos filtros.</div>
				</div>
			</div>
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

.axis-container {
	max-width: 96px;
	max-height: 96px;
	margin-right: 1rem;
}

.flex-bottom {
	align-self: flex-end;
}

</style>
