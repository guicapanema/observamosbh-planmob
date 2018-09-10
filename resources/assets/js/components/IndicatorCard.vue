<template>
	<div class="box is-bordered-info">
		<!-- <b-tooltip :label="indicator.formula" type="is-light" multilined> -->
			<div>
				<div class="content">
					<h1 class="title has-text-info is-size-6">
						{{indicator.name}}
					</h1>
				</div>

				<p v-if="indicator.description">
					{{indicator.description}}
				</p>

				<chart-new
					v-if="years.length"
					:labels="years"
					:datasets_left="datasets"
					class="indicator-chart">
				</chart-new>

				<div class="columns is-size-7">
					<div v-if="indicator.target_short" class="column">
						Curto prazo: {{indicator.target_short}} {{ indicator.unit }}
					</div>
					<div v-if="indicator.target_medium" class="column">
						Médio prazo: {{indicator.target_medium}} {{ indicator.unit }}
					</div>
					<div v-if="indicator.target_long" class="column">
						Longo prazo: {{indicator.target_long}} {{ indicator.unit }}
					</div>
				</div>
			</div>
		<!-- </b-tooltip> -->
	</div>
</template>

<script>
	export default {
		props: ['indicator'],

		data() {
			return {
				datasets: [],
				years: [],
			};
		},

		mounted()
		{
			this.parseYears();

			this.parseData();
		},

		methods:
		{
			parseData()
			{
				let dataset = {
					label: this.indicator.name,
					data: this.indicator.data.map(data => data.value),
					color: 'rgb(82, 161, 212)',
					unit: this.indicator.unit,
				};

				this.datasets.push(dataset);

				if (this.indicator.target_short) {
					let target_short_dataset = {
						label: 'Meta de curto prazo',
						data: Array(this.years.length).fill(this.indicator.target_short),
						color: 'hsl(0, 0%, 48%)',
						unit: this.indicator.unit,
					};

					this.datasets.push(target_short_dataset);
				}
				if (this.indicator.target_medium) {
					let target_medium_dataset = {
						label: 'Meta de médio prazo',
						data: Array(this.years.length).fill(this.indicator.target_medium),
						color: 'hsl(0, 0%, 71%)',
						unit: this.indicator.unit,
					};

					this.datasets.push(target_medium_dataset);
				}
				if (this.indicator.target_long) {
					let target_long_dataset = {
						label: 'Meta de curto prazo',
						data: Array(this.years.length).fill(this.indicator.target_long),
						color: 'hsl(0, 0%, 86%)',
						unit: this.indicator.unit,
					};

					this.datasets.push(target_long_dataset);
				}
			},

			parseYears()
			{
				for (let data of this.indicator.data) {
					let year = Number(data.date.split('-')[0]);

					if (this.years.indexOf(year) < 0) {
						this.years.push(year);
					}
				}
			},
		}
	}
</script>

<style scoped>

	.indicator-chart {
		height: 150px;
	}

</style>
