<template>
	<nav class="panel">
		<p class="panel-heading">
			Filtros
			<b-tooltip label="Visão em colunas" type="is-light" position="is-bottom" class="is-pulled-right">
				<div class="view-button" @click="onColumn()">
					<b-icon icon="columns" type="is-info" size="is-small"></b-icon>
				</div>
			</b-tooltip>
		</p>
		<div class="panel-block">
			<p class="control has-icons-left">
				<input v-model="filters['search']" class="input is-small" type="text" placeholder="buscar">
				<span class="icon is-small is-left">
					<i class="fa fa-search"></i>
				</span>
			</p>
		</div>
		<p class="panel-tabs">
			<a :class="{'is-active': view === 'modals'}" @click="view = 'modals'">modais</a>
			<a :class="{'is-active': view === 'tags'}" @click="view = 'tags'">tags</a>
		</p>
		<template v-if="view === 'modals'">
			<a :class="{'panel-block': true,
						'is-active': hasModal('pedestre')}"
				@click="onSetModal('pedestre')">
				<span class="panel-icon">
					<i class="fa fa-female"></i>
				</span>
				pedestre
			</a>
			<a :class="{'panel-block': true,
						'is-active': hasModal('bicicleta')}"
				@click="onSetModal('bicicleta')">
				<span class="panel-icon">
					<i class="fa fa-bicycle"></i>
				</span>
				bicicleta
			</a>
			<a :class="{'panel-block': true,
						'is-active': hasModal('onibus')}"
				@click="onSetModal('onibus')">
				<span class="panel-icon">
					<i class="fa fa-bus"></i>
				</span>
				ônibus
			</a>
			<a :class="{'panel-block': true,
						'is-active': hasModal('metro')}"
				@click="onSetModal('metro')">
				<span class="panel-icon">
					<i class="fa fa-subway"></i>
				</span>
				metrô
			</a>
			<a :class="{'panel-block': true,
						'is-active': hasModal('logistica')}"
				@click="onSetModal('logistica')">
				<span class="panel-icon">
					<i class="fa fa-truck"></i>
				</span>
				logística
			</a>
		</template>
		<template v-if="view === 'tags'">
			<a  v-for="tag of tags"
				:class="{'panel-block': true,
						'is-active': hasTag(tag)}"
				@click="onSetTag(tag)">
				{{tag}}
			</a>
		</template>
		<div class="panel-block">
			<button class="button is-primary is-outlined is-fullwidth"
					@click="onCleanFilters()">
				limpar filtros
			</button>
		</div>
	</nav>
</template>

<script>

    export default {

		props: ['filters', 'tags'],

		data() {
			return {
				view: 'modals'
			}
		},

		mounted() {
			Vue.set(this.filters, 'search', '');
		},

		methods: {

			hasModal(modal) {
				if(this.filters['modals']) {
					return this.filters['modals'].indexOf(modal) >= 0;
				}
				return false;
			},

			hasTag(tag) {
				if(this.filters['tags']) {
					return this.filters['tags'].indexOf(tag) >= 0;
				}
				return false;
			},

			onColumn() {
				this.$emit('column');
			},

			onSetModal(modal) {
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
					let index = queryModals.indexOf(modal);
					if(index >= 0) {
						queryModals.splice(index, 1);
					} else {
						queryModals.push(modal);
					}
				}

				this.$router.push({ path: '/busca', query: {...this.$route.query, modal: queryModals} });

			},

			onSetTag(tag) {
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
					let index = queryTags.indexOf(tag);
					if(index >= 0) {
						queryTags.splice(index, 1);
					} else {
						queryTags.push(tag);
					}
				}
				this.$router.push({ path: '/busca', query: {...this.$route.query, tag: queryTags} });
			},

			onCleanFilters() {
				this.$router.push('/busca');
			}

		},
    }

</script>


<style scoped>

.view-button {
	cursor: pointer;
}

</style>
