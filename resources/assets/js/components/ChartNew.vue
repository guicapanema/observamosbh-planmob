<script>
	import { Line } from 'vue-chartjs'
	export default {

		extends: Line,

		props: ['axis_left', 'axis_right', 'axis_bottom', 'big_font', 'datasets_left', 'datasets_right', 'labels', 'display_legend', 'tooltip'],

		mounted () {
			this.parseInputData();
		},

		methods: {

			parseInputData() {
				let innerDatasets = [];
				let xAxes = [];
				let yAxes = [];

				if (this.axis_bottom) {
					xAxes.push(this.axis_bottom);
				}

				if (this.datasets_left && this.datasets_left.length) {
					let default_left = {
						id: 'axis-left',
						type: 'linear',
						unit: this.datasets_left[0].unit,
						ticks: {
							fontSize: this.big_font == true ? 14 : 12,
							beginAtZero: true,
						},
						scaleLabel: {
							display: true,
							fontSize: this.big_font == true ? 14 : 12,
							labelString: this.datasets_left[0].unit
						},
					};

					yAxes.push( {...default_left, ...this.axis_left} );

					for (let dataset of this.datasets_left) {
						let newDataset = {};

						newDataset.label = dataset.label;
						newDataset.borderColor = dataset.color;
						newDataset.backgroundColor = 'transparent';
						newDataset.data = dataset.data;
						newDataset.yAxisID = 'axis-left';
						newDataset.spanGaps = true;

						newDataset.pointRadius = dataset.pointRadius ? dataset.pointRadius : 3;
						newDataset.pointHoverRadius = newDataset.pointRadius + 1;
						newDataset.pointBackgroundColor = dataset.pointBackgroundColor ? dataset.pointBackgroundColor : 'transparent';
						newDataset.is_target = dataset.is_target;

						innerDatasets.push(newDataset);
					}
				}

				if (this.datasets_right && this.datasets_right.length) {
					let default_right = {
						id: 'axis-right',
						type: 'linear',
						unit: this.datasets_right[0].unit,
						position: 'right',
						ticks: {
							fontSize: this.big_font == true ? 14 : 12,
							beginAtZero: true,
						},
						scaleLabel: {
							display: true,
							fontSize: this.big_font == true ? 14 : 12,
							labelString: this.datasets_right[0].unit,
						},
						gridLines: {
							drawOnChartArea: false
						},
					};

					yAxes.push( {...default_right, ...this.axis_right} );

					for (let dataset of this.datasets_right) {
						let newDataset = {};

						newDataset.label = dataset.label;
						newDataset.borderColor = dataset.color;
						newDataset.backgroundColor = 'transparent';
						newDataset.data = dataset.data;
						newDataset.yAxisID = 'axis-right';
						newDataset.spanGaps = true;

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
						xAxes: xAxes,
						yAxes: yAxes
					},
					legend: {
						display: this.display_legend,
						position: 'bottom',
						labels: {
							boxWidth: 20,
						},
					},
					tooltips: {
						callbacks: {
							title: (tooltips) => {
								return innerDatasets[tooltips[0].datasetIndex].is_target ?  '' : tooltips[0].xLabel;
							},
						}
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
