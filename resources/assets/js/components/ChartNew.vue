<script>
	import { Line } from 'vue-chartjs'
	export default {

		extends: Line,

		props: ['datasets_left', 'datasets_right', 'labels', 'display_legend'],

		mounted () {
			this.parseInputData();
		},

		methods: {

			parseInputData() {
				let innerDatasets = [];
				let yAxes = [];

				if (this.datasets_left && this.datasets_left.length) {
					yAxes.push({
						id: 'axis-left',
						type: 'linear',
						unit: this.datasets_left[0].unit,
						ticks: {
							beginAtZero: true
						},
						scaleLabel: {
							display: true,
							labelString: this.datasets_left[0].unit
						},
					});

					for (let dataset of this.datasets_left) {
						let newDataset = {};

						newDataset.label = dataset.label;
						newDataset.borderColor = dataset.color;
						newDataset.backgroundColor = 'transparent';
						newDataset.data = dataset.data;
						newDataset.yAxisID = 'axis-left';

						innerDatasets.push(newDataset);
					}
				}

				if (this.datasets_right && this.datasets_right.length) {
					yAxes.push({
						id: 'axis-right',
						type: 'linear',
						unit: this.datasets_right[0].unit,
						position: 'right',
						ticks: {
							beginAtZero: true
						},
						scaleLabel: {
							display: true,
							labelString: this.datasets_right[0].unit
						},
						gridLines: {
							drawOnChartArea: false
						}
					});

					for (let dataset of this.datasets_right) {
						let newDataset = {};

						newDataset.label = dataset.label;
						newDataset.borderColor = dataset.color;
						newDataset.backgroundColor = 'transparent';
						newDataset.data = dataset.data;
						newDataset.yAxisID = 'axis-right';

						innerDatasets.push(newDataset);
					}
				}

				this.renderChart({
					labels: this.labels,
					datasets: innerDatasets,
				},
				{
					responsive: true,
					maintainAspectRatio: false,
					legend: {display: false},
					scales: {
						yAxes: yAxes
					},
					legend: {
						display: this.display_legend,
						position: 'bottom',
						labels: {
							boxWidth: 20,
						},
					}
				});
			}

		},

		watch: {
			datasets_left(newDatasets, oldDatasets)
			{
				this.$data._chart.destroy()
				this.parseInputData();
			},

			datasets_right(newDatasets, oldDatasets)
			{
				this.$data._chart.destroy()
				this.parseInputData();
			}
		}
	}
</script>
