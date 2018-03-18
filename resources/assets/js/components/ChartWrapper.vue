<template>
	<div>
		<div class="box legend control">
			<label v-for="dataset of datasets" class="checkbox">
				<input type="checkbox" v-model="dataset.show">
				<span :style="'color: rgb(' + dataset.color.join(',') + ')'">{{dataset.label}}</span>
			</label>
		</div>
		<chart
			v-if="shownDatasets.length > 0" 
			:labels="labels"
			:datasets="shownDatasets"
			class="grafico-indicadores">
		</chart>

	</div>

</template>

<script>
	export default {

		data() {
			return {
				datasets: [{
					label: 'Recursos efetivamente aplicados em Mobilidade Urbana (%)',
					data: [27.05, 54.24, 49.07, 76.94, 41.22, 29.70, 30.56],
					color: [82, 161, 212],
					unit: '%',
					show: true
				}, {
					label: 'Orçamento municipal investido em mobilidade urbana (%)',
					data: [3.73, 7.40, 8.16, 10.08, 6.34, 3.54, 3.11],
					color: [230, 68, 97],
					unit: '%',
					show: true
				}, {
					label: 'Recursos pagos (efetivamente gastos) em todas as rubricas da Área de Resultado Cidade com Mobilidade/População estimada de BH (R$)',
					data: [74.26, 172.17, 222.99, 300.33, 199.75, 109.40, 105.74],
					color: [223, 174, 57],
					unit: 'R$',
					show: true
				}],
				labels: ['2010', '2011', '2012', '2013', '2014', '2015', '2016']
			}
		},

		computed: {
			shownDatasets() {
				return this.datasets.filter(dataset => dataset.show === true);
			}
		},

		mounted () {
		}

	}

</script>

<style>

</style>
