<template>
	<nav class="panel">
		<p class="panel-heading">
			Navegação
			<b-tooltip label="Busca e filtros" type="is-light" position="is-bottom" class="is-pulled-right">
				<div class="view-button" @click="onSearch()">
					<b-icon icon="search" type="is-info" size="is-small"></b-icon>
				</div>
			</b-tooltip>
		</p>

		<template v-for="axis of axes">
			<a :class="{'panel-block': true,
						'is-active': isActive(axis, 'axis')}"
				@click="onSelect(axis, 'axis')">

				<span class="panel-icon">
					<i :class="{'fa': true,
								'fa-caret-right': !isExpanded(axis),
								'fa-caret-down': isExpanded(axis) }"></i>
				</span>
				{{ axis.name }}
			</a>
			<template v-if="isExpanded(axis)">
				<a v-for="program of getAxisPrograms(axis)"
					:class="{'panel-block': true,
							'is-active': isActive(program, 'program') }"
					@click="onSelect(program, 'program')">
					{{ program.name }}
				</a>
			</template>
		</template>
	</nav>
</template>

<script>

    export default {

		props: ['axes', 'filters', 'programs'],

		data() {
			return {
				expandedAxes: []
			}
		},

		mounted() {
		},

		methods: {
			getAxisPrograms(axis) {
				return this.programs.filter(program => {
					return program.axis_id === axis.id;
				});
			},

			onSearch() {
				this.$emit('search');
			},

			onSelect(item, type) {
				if(type === 'axis') {
					let path = '/eixo/' + item.alias;
					if (path === this.$route.path) {
						this.$router.push('/');
					} else {
						this.$router.push(path);
					}
				} else if (type === 'program') {
					let axisAlias = this.axes.find(axis => {
						return axis.id === item.axis_id;
					}).alias;
					let programAlias = item.alias;
					this.$router.push({ path: `/eixo/${axisAlias}/programa/${programAlias}` });
				}
			},

			// onToggle(axis) {
			// 	let index = this.expandedAxes.indexOf(axis.name);
			// 	if (index >= 0) {
			// 		this.expandedAxes.splice(index, 1);
			// 	} else {
			// 		this.expandedAxes.push(axis.name);
			// 	}
			// },

			isExpanded(axis) {
				let index = this.expandedAxes.indexOf(axis.name);
				return (index >= 0) || this.isActive(axis, 'axis');
			},

			isActive(item, type) {
				if (type === 'axis') {
					return (this.filters['axis'] === item.id);
				} else if (type === 'program') {
					return (this.filters['program'] === item.id);
				}
				return false;
			}
		},
    }

</script>

<style scoped>

.view-button {
	cursor: pointer;
}

</style>
