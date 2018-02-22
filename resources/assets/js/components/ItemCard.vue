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
					<template v-if="path" >
						<span class="item-path is-size-7 has-text-weight-light">
							{{ path }}
						</span>
						<br>
					</template>
					<strong>

						{{item.name}}
					</strong>
					<br>
					{{item.description}}
				</p>
			</div>
			<nav v-if="item.modals" class="level is-mobile">
				<div class="level-left">
					<span v-for="modal of item.modals" @click.capture.stop="onModalSelect(modal)">
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
			<nav v-if="item.tags" class="level is-mobile">
				<div class="level-left">
					<div class="tags">
						<span v-for="tag of item.tags" class="tag is-info" @click.capture.stop="onTagSelect(tag)">{{tag}}</span>
					</div>
				</div>
			</nav>
		</div>
		<div v-if="item.programs || item.actions || item.indicators" class="media-right">
			<template v-if="item.programs">
				<b-tooltip :label="item.programs.length + ' programas'" type="is-light" class="is-pulled-right">
					<small>{{item.programs.length}} <i class="fas fa-cogs"></i></small>
				</b-tooltip>
				<br />
			</template>
			<template v-if="item.actions">
				<b-tooltip :label="item.actions.length + ' ações'" type="is-light" class="is-pulled-right">
					<small>{{item.actions.length}} <i class="fas fa-check-square"></i></small>
				</b-tooltip>
				<br />
			</template>
			<template v-if="item.indicators">
				<b-tooltip :label="item.indicators.length + ' indicadores'" type="is-light" class="is-pulled-right">
					<small>{{item.indicators.length}} <i class="fas fa-chart-line"></i></small>
				</b-tooltip>
				<br />
			</template>
		</div>
	</article>
</template>


<script>

    export default {
		props: ['item', 'path'],

		methods: {

			onClick() {
				this.$emit('click');
			},

			onModalSelect(modal) {
				let queryModals = this.$route.query['modal'];
				if(!queryModals) {
					queryModals = modal;
				} else if(typeof queryModals === 'string') {
					if (queryModals === modal) {
						queryModals = null;
					} else {
						queryModals = [queryModals, modal];
					}
				} else {
					queryModals = queryModals.slice();
					let index = queryModals.indexOf(modal);
					if(index >= 0) {
						queryModals.splice(index, 1);
					} else {
						queryModals.push(modal);
					}
				}

				this.$router.push({ path: '/busca', query: {...this.$route.query, modal: queryModals} });
			},

			onTagSelect(tag) {
				let queryTags = this.$route.query['tag'];
				if(!queryTags) {
					queryTags = tag;
				} else if(typeof queryTags === 'string') {
					if (queryTags === tag) {
						queryTags = null;
					} else {
						queryTags = [queryTags, tag];
					}
				} else {
					queryTags = queryTags.slice();
					let index = queryTags.indexOf(tag);
					if(index >= 0) {
						queryTags.splice(index, 1);
					} else {
						queryTags.push(tag);
					}
				}
				this.$router.push({ path: '/busca', query: {...this.$route.query, tag: queryTags} });
			}

		},
    }

</script>


<style scoped>

article:hover {
	cursor: pointer;
	background-color: rgb(249, 249, 249);
}

.item-path {
	color: grey;
}

span.icon {
	margin-right: 0.7em;
}

</style>
