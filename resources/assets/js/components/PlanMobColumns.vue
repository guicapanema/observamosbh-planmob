<template>
	<div class="column columns">
		<div class="column">
			<nav class="breadcrumb" aria-label="breadcrumbs">
				<ul>
					<li><router-link to="/">Eixos</router-link></li>
					<li v-for="breadcrumb of breadcrumbs" class="is-capitalized">
						<router-link :to="breadcrumb.href">{{breadcrumb.name}}</router-link>
					</li>
				</ul>
			</nav>
			<template v-if="view === 'axes'">
				<item-card v-for="item of filteredAxes" :key="'axis' + item.id" :item="item" @click="onSelect(item, 'axis')"></item-card>
				<div v-if="!filteredAxes || filteredAxes.length === 0">Nenhum item corresponde aos filtros.</div>
			</template>
			<template v-if="view === 'programs'">
				<item-card v-for="item of filteredPrograms" :key="'program' + item.id" :item="item" @click="onSelect(item, 'program')"></item-card>
				<div v-if="!filteredPrograms || filteredPrograms.length === 0">Nenhum item corresponde aos filtros.</div>
			</template>
			<template v-if="view === 'actions'">
				<item-card v-for="item of filteredActions" :key="'action' + item.id" :item="item" @click="onSelect(item, 'action')"></item-card>
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
					let matchPrograms = true;
					if (this.filters['programs']) {
						matchPrograms = (this.filters['programs'].indexOf(action.program_id) >= 0);
					}
					return matchPrograms;
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
						let matchAxis = true;
						if (this.filters['axes']) {
							matchAxis = (this.filters['axes'].indexOf(indicator.parent_id) >= 0);
						}
						return matchAxis && (indicator.parent_type === 'axis');
					}
					if(this.view === 'actions') {
						let matchProgram = true;
						if (this.filters['programs']) {
							matchProgram = (this.filters['programs'].indexOf(indicator.parent_id) >= 0);
						}
						return matchProgram && (indicator.parent_type === 'program');
					}
				});
			},

			filteredPrograms() {
				return this.programs.filter(program => {
					let matchAxis = true;
					let matchModals = true;
					if (this.filters['axes']) {
						matchAxis = (this.filters['axes'].indexOf(program.axis_id) >= 0);
					}
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
