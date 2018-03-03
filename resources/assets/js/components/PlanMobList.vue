<template>
	<div class="columns">
		<div class="column is-one-fifth">
			<filters-menu :filters="filters" :tags="tags" @column="onColumn()"></filters-menu>
		</div>

		<div class="column">
`			<!-- Main container -->
			<nav class="level">
				<!-- Left side -->
				<div class="level-left">
					<p class="level-item"><strong>
						Tudo ( {{filteredAxes.length + filteredPrograms.length + filteredActions.length + filteredIndicators.length}} )
					</strong></p>
					<p class="level-item"><a href="#eixos">Eixos ( {{filteredAxes.length}} )</a></p>
					<p class="level-item"><a href="#programas">Programas ( {{filteredPrograms.length}} )</a></p>
					<p class="level-item"><a href="#acoes">Ações ( {{filteredActions.length}} )</a></p>
					<p class="level-item"><a href="#indicadores">Indicadores ( {{filteredIndicators.length}} )</a></p>
				</div>

				<!-- Right side -->
				<div class="level-right">

				</div>
			</nav>`
			<template v-if="filteredAxes.length > 0">
				<h1 id="eixos" class="subtitle">Eixos</h1>
				<item-card v-for="item of filteredAxes" :key="'axis' + item.id" :item="item" @click="onSelect(item, 'axis')"></item-card>
			</template>
			<template v-if="filteredPrograms.length > 0">
				<h1 id="programas" class="subtitle">Programas</h1>
				<item-card v-for="item of filteredPrograms"
					:key="'program' + item.id"
					:item="item"
					:path="getPath(item, 'program')"
					@click="onSelect(item, 'program')"></item-card>
			</template>
			<template v-if="filteredActions.length > 0">
				<h1 id="acoes" class="subtitle">Ações</h1>
				<item-card v-for="item of filteredActions"
				:key="'action' + item.id"
				:item="item"
				:path="getPath(item, 'action')"
				@click="onSelect(item, 'action')"></item-card>
			</template>
			<template v-if="filteredIndicators.length > 0">
				<h1 id="indicadores" class="subtitle">Indicadores</h1>
				<item-card v-for="item of filteredIndicators"
				:key="'indicator' + item.id"
				:item="item"
				:path="getPath(item, 'indicator')"></item-card>
			</template>
			<!-- <template v-if="filteredIndicators.length > 0">
				<h1 class="subtitle">Indicadores</h1>
				<div v-for="indicator of filteredIndicators" class="box">
					<b-tooltip :label="indicator.formula" type="is-light" multilined>
						{{indicator.name}}
					</b-tooltip>
				</div>
			</template> -->
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
					let matchSearch = true;
					let matchProgram = this.filters['program'] ? this.filters['program'] === action.program_id : true;
					let matchModals = true;
					let matchTags = true;
					if(this.filters['search']) {
						let objeto = JSON.stringify(action).toLowerCase();
						let search = this.filters['search'].toLowerCase().trim();
						if(objeto.indexOf(search) < 0) {
							matchSearch = false;
						}
					}
					if(this.filters['modals']) {
						this.filters['modals'].forEach(modal => {
							if(action.modals.indexOf(modal) < 0) {
								matchModals = false;
							}
						});
					}
					if(this.filters['tags']) {
						this.filters['tags'].forEach(tag => {
							if(action.tags.indexOf(tag) < 0) {
								matchTags = false;
							}
						});
					}
					return matchSearch && matchProgram && matchModals && matchTags;
				});
			},

			filteredAxes() {
				return this.axes.filter(axis => {
					let matchSearch = true;
					let matchModals = true;
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
								matchModals = false;
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
					return matchSearch && matchModals && matchTags;
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
					return matchSearch;
				});
			},

			filteredPrograms() {
				return this.programs.filter(program => {
					let matchSearch = true;
					let matchAxis = this.filters['axis'] ? this.filters['axis'] === program.axis_id : true;
					let matchModais = true;
					let matchTags = true;
					if(this.filters['search']) {
						let objeto = JSON.stringify(program).toLowerCase();
						let search = this.filters['search'].toLowerCase().trim();
						if(objeto.indexOf(search) < 0) {
							matchSearch = false;
						}
					}
					if(this.filters['modals']) {
						this.filters['modals'].forEach(modal => {
							if(program.modals.indexOf(modal) < 0) {
								matchModais = false;
							}
						});
					}
					if(this.filters['tags']) {
						this.filters['tags'].forEach(tag => {
							if(program.tags.indexOf(tag) < 0) {
								matchTags = false;
							}
						});
					}
					return matchSearch && matchAxis && matchModais && matchTags;
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

			getPath(item, type) {
				let path = '';
				if(type === 'program') {
					let axis = this.axes.find(axis => axis.id === item.axis_id);
					path = axis.name;
				}
				if(type === 'action') {
					let program = this.programs.find(program => program.id === item.program_id);
					let axis = this.axes.find(axis => axis.id === program.axis_id);

					path = axis.name + ' > ' + program.name;
				}
				if(type === 'indicator') {
					if(item.parent_type === 'global') {
						return null;
					} else if(item.parent_type === 'App\\Axis') {
						let axis = this.axes.find(axis => axis.id === item.parent_id);
						path = axis.name;
					} else if(item.parent_type === 'App\\Program') {
						let program = this.programs.find(program => program.id === item.parent_id);
						let axis = this.axes.find(axis => axis.id === program.axis_id);
						path = axis.name + ' > ' + program.name;
					}
				}
				return path;
			},

			onColumn() {
				this.$emit('column');
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

		}
    }
</script>
