<template>
	<article :class="{
				'media': true,
				'box': true,
				'hoverable': !isAction,
				'is-bordered-success': isAxis,
				'is-bordered-warning': isProgram,
				'is-bordered-danger': isAction,
				'is-bordered-info': isIndicator
				}" @click="onClick()">
		<figure v-if="item.image" class="media-left">
			<p class="image is-hidden-mobile is-96x96">
				<img :src="item.image">
			</p>
			<p class="image is-hidden-tablet is-48x48">
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
					<div class="item-title">
						{{item.name}}
					</div>
					<p class="item-description">
						{{item.description}}
					</p>
				</p>
			</div>
			<div v-if="item.modals">
					<span v-for="modal of item.modals" @click.capture.stop="onModalSelect(modal)">
						<b-tooltip :label="modal" type="is-light">
							<b-icon v-if="modal === 'pedestre'" icon="female" type="is-grey"></b-icon>
							<b-icon v-if="modal === 'bicicleta'" icon="bicycle" type="is-grey"></b-icon>
							<b-icon v-if="modal === 'onibus'" icon="bus" type="is-grey"></b-icon>
							<b-icon v-if="modal === 'metro'" icon="subway" type="is-grey"></b-icon>
							<b-icon v-if="modal === 'logistica'" icon="truck" type="is-grey"></b-icon>
							<b-icon v-if="modal === 'individual motorizado'" icon="car" type="is-grey"></b-icon>
						</b-tooltip>
					</span>
			</div>
			<div v-if="item.tags" class="tags has-margin-top-50">
				<span v-for="tag of item.tags" class="tag is-grey" @click.capture.stop="onTagSelect(tag)">{{tag}}</span>
			</div>
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

		computed: {
			isAction() {
				return (this.item.program_id !== null) && (this.item.program_id !== undefined);
			},
			isAxis() {
				return (!this.item.program_id && !this.item.parent_id && !this.item.axis_id && !this.item.parent_type);
			},
			isIndicator() {
				return (this.item.parent_type !== null) && (this.item.parent_type !== undefined);
			},
			isProgram() {
				return (this.item.axis_id !== null) && (this.item.axis_id !== undefined);
			}
		},

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

article.hoverable:hover {
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
