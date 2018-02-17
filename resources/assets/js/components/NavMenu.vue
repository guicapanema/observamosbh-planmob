<template>
	<nav class="panel">
		<p class="panel-heading">
			Navegação
		</p>

		<template v-for="axis of axes">
			<a class="panel-block" @click="onToggle(axis)">
				<span class="panel-icon">
					<i :class="{'fa': true,
								'fa-caret-right': !isExpanded(axis),
								'fa-caret-down': isExpanded(axis) }"></i>
				</span>
				{{ axis.name }}
			</a>
			<template v-if="isExpanded(axis)">
				<a v-for="program of getAxisPrograms(axis)" class="panel-block">
					{{ program.name }}
				</a>
			</template>
		</template>
	</nav>
</template>

<script>

    export default {

		props: ['axes', 'programs'],

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

			onToggle(axis) {
				let index = this.expandedAxes.indexOf(axis.name);
				if (index >= 0) {
					this.expandedAxes.splice(index, 1);
				} else {
					this.expandedAxes.push(axis.name);
				}
			},

			isExpanded(axis) {
				let index = this.expandedAxes.indexOf(axis.name);
				return index >= 0;
			}
		},
    }

</script>
