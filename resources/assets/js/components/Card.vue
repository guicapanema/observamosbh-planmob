<template>
	<article class="media box" @click="onClick()">
		<figure v-if="item.image" class="media-left">
			<p class="image is-64x64">
				<img :src="item.image">
			</p>
		</figure>
		<div class="media-content">
			<div class="content">
				<p>
					<strong>{{item.name}}</strong>
					<br>
					{{item.description}}
				</p>
			</div>
			<nav class="level is-mobile">
				<div class="level-left">
					<span v-for="modal of item.modals">
						<b-tooltip :label="modal" type="is-light">
							<b-icon v-if="modal === 'pedestre'" icon="female" type="is-info"></b-icon>
							<b-icon v-if="modal === 'bicicleta'" icon="bicycle" type="is-info"></b-icon>
							<b-icon v-if="modal === 'onibus'" icon="bus" type="is-info"></b-icon>
							<b-icon v-if="modal === 'metro'" icon="subway" type="is-info"></b-icon>
							<b-icon v-if="modal === 'logistica'" icon="truck" type="is-info"></b-icon>
							<b-icon v-if="modal === 'individual motorizado'" icon="car" type="is-info"></b-icon>
						</b-tooltip>
					</span>
				</div>
			</nav>
			<nav class="level is-mobile">
				<div class="level-left">
					<div class="tags">
						<span v-for="tag of item.tags" class="tag is-info">{{tag}}</span>
					</div>
				</div>
			</nav>
		</div>
		<div class="media-right">
			<b-tooltip label="8 programas" type="is-light">
				<small>8 <i class="fas fa-cogs"></i></small>
			</b-tooltip><br />
			<b-tooltip label="10 ações" type="is-light">
				<small>10 <i class="fas fa-check-square"></i></small>
			</b-tooltip><br />
			<b-tooltip label="11 indicadores" type="is-light">
				<small>11 <i class="fas fa-chart-line"></i></small>
			</b-tooltip><br />
		</div>
	</article>
</template>


<script>

    export default {
		props: ['item'],

		methods: {

			onClick() {
				this.$emit('click');
			}

		},
    }

</script>


<style scoped>

article:hover {
	cursor: pointer;
	background-color: rgb(249, 249, 249);
}

</style>
