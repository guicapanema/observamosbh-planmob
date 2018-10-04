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

				<div v-else class="columns is-size-7">
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

			if (this.years.length) {
				this.parseData();
			}
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
					let data = Array(this.years.length - 1).fill(null);
					data.push(this.indicator.target_short);

					let target_short_dataset = {
						label: 'Meta 2020',
						data: data,
						unit: this.indicator.unit,
						pointBackgroundColor: 'hsl(0, 0%, 48%)',
						pointRadius: 5,
						is_target: true,
					};

					this.datasets.push(target_short_dataset);
				}
				if (this.indicator.target_medium) {
					let data = Array(this.years.length - 1).fill(null);
					data.push(this.indicator.target_medium);

					let target_medium_dataset = {
						label: 'Meta 2025',
						data: data,
						unit: this.indicator.unit,
						pointBackgroundColor: 'hsl(0, 0%, 71%)',
						pointRadius: 7,
						is_target: true,
					};

					this.datasets.push(target_medium_dataset);
				}
				if (this.indicator.target_long) {
					let data = Array(this.years.length - 1).fill(null);
					data.push(this.indicator.target_long);

					let target_long_dataset = {
						label: 'Meta 2030',
						data: data,
						unit: this.indicator.unit,
						pointBackgroundColor: 'hsl(0, 0%, 86%)',
						pointRadius: 9,
						is_target: true,
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
