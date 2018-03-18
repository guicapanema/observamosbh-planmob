<script>
	import { Line } from 'vue-chartjs'
	export default {

		extends: Line,

		props: ['datasets', 'labels'],

		mounted () {
			this.parseInputData();
		},

		methods: {

			parseInputData() {
				let innerDatasets = [];
				let yAxes = [{
					id: 'axis-0',
					type: 'linear',
					unit: this.datasets[0].unit,
					ticks: {
						beginAtZero: true
					},
					scaleLabel: {
						display: true,
						labelString: this.datasets[0].unit
					}
				}];

				for (let dataset of this.datasets) {
					let newDataset = {};

					newDataset.label = dataset.label;
					newDataset.borderColor = 'rgb(' + dataset.color.join(',') + ')';
					newDataset.backgroundColor = 'transparent';
					newDataset.data = dataset.data;

					let matchedAxis = yAxes.find(axis => axis.unit === dataset.unit);
					if (matchedAxis) {
						newDataset.yAxisID = matchedAxis.id;
					} else if (yAxes.length == 1){
						let newAxis = {
			                id: 'axis-1',
			                type: 'linear',
							unit: dataset.unit,
							position: 'right',
							ticks: {
								beginAtZero: true
							},
							scaleLabel: {
								display: true,
								labelString: dataset.unit
							},
							gridLines: {
								color: newDataset.borderColor,
								drawOnChartArea: false
							}
						};
						newDataset.yAxisID = newAxis.id;
						yAxes.push(newAxis);
					}
					innerDatasets.push(newDataset);
				}
				this.renderChart({
					labels: this.labels,
					datasets: innerDatasets,
				}, {responsive: true,
					maintainAspectRatio: false,
					legend: {display: false},
					scales: {
			            yAxes: yAxes
	        	}});
			}

		},

		watch: {
			datasets(newDatasets, oldDatasets) {
				this.$data._chart.destroy()
				this.parseInputData();
			}
		}
	}
</script>
