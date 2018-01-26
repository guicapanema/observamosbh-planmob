<template>
	<nav class="panel">
		<p class="panel-heading">
			Filtros
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
			this.filters['search'] = '';
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

			onSetModal(modal) {
				if(this.filters['modals']) {
					let index = this.filters['modals'].indexOf(modal);
					if(index >= 0) {
						this.filters['modals'].splice(index, 1);
					} else {
						this.filters['modals'].push(modal);
					}
				} else {
					Vue.set(this.filters, 'modals', [modal]);
				}
			},

			onSetTag(tag) {
				if(this.filters['tags']) {
					let index = this.filters['tags'].indexOf(tag);
					if(index >= 0) {
						this.filters['tags'].splice(index, 1);
					} else {
						this.filters['tags'].push(tag);
					}
				} else {
					Vue.set(this.filters, 'tags', [tag]);
				}
			},

			onCleanFilters() {
				for (let key in this.filters) {
					if (key === 'search') {
						this.filters[key] = '';
					} else {
						this.filters[key] = [];
					}
				}
				this.$router.push('/');
			}

		},
    }

</script>
