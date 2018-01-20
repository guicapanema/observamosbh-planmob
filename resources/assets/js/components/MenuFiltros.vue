<template>
	<nav class="panel">
		<p class="panel-heading">
			Filtros
		</p>
		<div class="panel-block">
			<p class="control has-icons-left">
				<input v-model="filtros['busca']" class="input is-small" type="text" placeholder="buscar">
				<span class="icon is-small is-left">
					<i class="fa fa-search"></i>
				</span>
			</p>
		</div>
		<p class="panel-tabs">
			<a :class="{'is-active': visao === 'modais'}" @click="visao = 'modais'">modais</a>
			<a :class="{'is-active': visao === 'tags'}" @click="visao = 'tags'">tags</a>
			<!-- <a>public</a>
			<a>private</a> -->
		</p>
		<template v-if="visao === 'modais'">
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
		<template v-if="visao === 'tags'">
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

		props: ['filtros', 'tags'],

		data() {
			return {
				visao: 'modais'
			}
		},

		mounted() {
			this.filtros['busca'] = '';
		},

		methods: {

			hasModal(modal) {
				if(this.filtros['modais']) {
					return this.filtros['modais'].indexOf(modal) >= 0;
				}
				return false;
			},

			hasTag(tag) {
				if(this.filtros['tags']) {
					return this.filtros['tags'].indexOf(tag) >= 0;
				}
				return false;
			},

			onSetModal(modal) {
				if(this.filtros['modais']) {
					let index = this.filtros['modais'].indexOf(modal);
					if(index >= 0) {
						this.filtros['modais'].splice(index, 1);
					} else {
						this.filtros['modais'].push(modal);
					}
				} else {
					Vue.set(this.filtros, 'modais', [modal]);
				}
			},

			onSetTag(tag) {
				if(this.filtros['tags']) {
					let index = this.filtros['tags'].indexOf(tag);
					if(index >= 0) {
						this.filtros['tags'].splice(index, 1);
					} else {
						this.filtros['tags'].push(tag);
					}
				} else {
					Vue.set(this.filtros, 'tags', [tag]);
				}
			},

			onCleanFilters() {
				for (let key in this.filtros) {
					this.filtros[key] = [];
				}
				this.$router.push('/');
			}

		},
    }

</script>
