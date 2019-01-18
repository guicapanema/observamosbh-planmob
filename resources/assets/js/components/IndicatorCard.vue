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

				<div class="buttons">

					<b-tooltip label="Ver fórmula" position="is-top" type="is-light">
						<a class="button is-small is-light" @click="is_formula_modal_open = true">
							<span class="icon is-small">
								<i class="fas fa-square-root-alt"></i>
							</span>
						</a>
					</b-tooltip>

					<b-tooltip label="Baixar série histórica" position="is-top" type="is-light">
						<a class="button is-small is-light" :href="'/indicadores/' + indicator.id + '/download'">
							<span class="icon is-small">
								<i class="fas fa-download"></i>
							</span>
						</a>
					</b-tooltip>

				</div>
			</div>
		<!-- </b-tooltip> -->

		<b-modal :active.sync="is_formula_modal_open" :width="640" scroll="keep">
			<div class="box content" style="width: auto">
				<p class="has-text-weight-bold">
					{{ indicator.name }}
				</p>
				<p>
					{{ indicator.formula }}
				</p>
            </div>
        </b-modal>
	</div>
</template>

<script>
	export default {
		props: ['indicator'],

		data() {
			return {
				datasets: [],
				is_formula_modal_open: false,
				max_points: 5,
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
				let data = this.indicator.data.map(data => data.value);

				console.debug(data.length - this.max_points);

				let dataset = {
					label: this.indicator.name,
					data: data.slice(-this.max_points),
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
				this.years = this.years.slice(-this.max_points);
			},
		}
	}
</script>

<style scoped>

	.indicator-chart {
		height: 150px;
		margin-bottom: 0.5rem;
	}

	.modal-card-foot {
		justify-content: right;
	}

	.buttons .button {
		margin-right: 0.5rem;
	}

</style>
