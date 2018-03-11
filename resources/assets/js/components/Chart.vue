<script>
	import { Line } from 'vue-chartjs'
	export default {
		extends: Line,
		mounted () {
			// Overwriting base render method with actual data.
			this.renderChart({
				labels: ['2010', '2011', '2012', '2013', '2014', '2015', '2016'],
				datasets: [
					{
						label: 'Recursos efetivamente aplicados em Mobilidade Urbana (%)',
						borderColor: 'rgb(82, 161, 212)',
						backgroundColor: 'rgba(82, 161, 212, 0.1)',
						data: [27.05, 54.24, 49.07, 76.94, 41.22, 29.70, 30.56],
						yAxisID: 'left-y-axis'
					},
					{
						label: 'Orçamento municipal investido em mobilidade urbana (%)',
						borderColor: 'rgb(230, 68, 97)',
						backgroundColor: 'rgba(230, 68, 97, 0.1)',
						data: [3.73, 7.40, 8.16, 10.08, 6.34, 3.54, 3.11],
						yAxisID: 'left-y-axis'
					},
					{
						label: 'Recursos pagos (efetivamente gastos) em todas as rubricas da Área de Resultado Cidade com Mobilidade/População estimada de BH (R$)',
						borderColor: 'rgb(223, 174, 57)',
						backgroundColor: 'rgba(223, 174, 57, 0.1)',
						data: [74.26, 172.17, 222.99, 300.33, 199.75, 109.40, 105.74],
						yAxisID: 'right-y-axis'
					}
				],
			}, {responsive: true, maintainAspectRatio: false, scales: {
            yAxes: [{
                id: 'left-y-axis',
                type: 'linear',
				ticks: {
					beginAtZero: true,
					callback: function(value, index, values) {
							return value + '%';
					}
				}
            }, {
                id: 'right-y-axis',
                type: 'linear',
				position: 'right',
				ticks: {
					beginAtZero: true,
					callback: function(value, index, values) {
							return 'R$' + value;
					}
				},
				gridLines: {
					drawOnChartArea: false, // only want the grid lines for one axis to show up
				}
            }]
        }})
		}
	}
</script>
