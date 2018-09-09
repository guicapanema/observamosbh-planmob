<template>
	<div>
		<div class="columns">

			<div class="column is-one-third">
				<div class="box is-bordered-info indicator-control is-paddingless">
					<div class="header content is-marginless">
						<h3 class="title has-text-info">
							Indicadores
						</h3>

						<p class="control has-icons-left">
							<input class="input is-small" type="text" placeholder="buscar" v-model="search.indicator">
							<span class="icon is-small is-left">
								<i class="fas fa-search" aria-hidden="true"></i>
							</span>
						</p>
					</div>
					<div class="body">
						<div v-for="indicator of displayedIndicatorsLeft" class="field is-size-7" >
							<b-checkbox type="is-info"
								v-model="selected.indicators_left"
								:native-value="indicator">

								{{ indicator.name }}

							</b-checkbox>
						</div>
					</div>
				</div>
			</div>

			<div class="column is-one-third">
				<div class="box is-bordered-danger indicator-control is-paddingless">
					<div class="header content is-marginless">
						<h3 class="title has-text-danger">
							Anos
						</h3>

						<p class="control has-icons-left">
							<input class="input is-small" type="text" placeholder="buscar" v-model="search.year">
							<span class="icon is-small is-left">
								<i class="fas fa-search" aria-hidden="true"></i>
							</span>
						</p>
					</div>
					<div class="body">
						<div v-for="year of displayedYears" class="field is-size-7" >
							<b-checkbox type="is-danger"
								v-model="selected.years"
								:native-value="year">

								{{ year }}

							</b-checkbox>
						</div>
					</div>
				</div>
			</div>

			<div class="column is-one-third">
				<div class="box is-bordered-warning indicator-control is-paddingless">
					<div class="header content is-marginless">
						<h3 class="title has-text-warning">
							Indicadores
						</h3>

						<p class="control has-icons-left">
							<input class="input is-small" type="text" placeholder="buscar" v-model="search.indicator2">
							<span class="icon is-small is-left">
								<i class="fas fa-search" aria-hidden="true"></i>
							</span>
						</p>
					</div>
					<div class="body">
						<div v-for="indicator of displayedIndicatorsRight" class="field is-size-7" >
							<b-checkbox type="is-warning"
								v-model="selected.indicators_right"
								:native-value="indicator">

								{{ indicator.name }}

							</b-checkbox>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="columns is-centered">
			<div class="column is-8">
				<chart-new
					:labels="selected.years"
					:datasets_left="getDatasetsLeft"
					:datasets_right="getDatasetsRight">
				</chart-new>
			</div>
		</div>

	</div>
</template>

<script>
	export default {

		data() {
			return {
				indicators: [],
				search: {
					indicator_left: '',
					indicator_right: '',
					year: '',
				},
				selected: {
					indicators_left: [],
					indicators_right: [],
					years: [],
				},
				years: [],
			}
		},

		computed: {

			getDatasetsLeft()
			{
				let datasets = [];

				for (let indicator of this.selected.indicators_left) {
					let data = indicator.data
						.filter(data => {
							let year = Number(data.date.split('-')[0]);
							return this.selected.years.indexOf(year) >= 0;
						})
						.map(data => data.value);

					let color = 'rgba(82, 161, 212, ' + (1 - 0.3 * datasets.length) + ')';

					let newDataset = {
						label: indicator.name,
						data: data,
						color: color,
						unit: indicator.unit,
					};
					datasets.push(newDataset);
				}

				return datasets;
			},

			getDatasetsRight()
			{
				let datasets = [];

				for (let indicator of this.selected.indicators_right) {
					let data = indicator.data
						.filter(data => {
							let year = Number(data.date.split('-')[0]);
							return this.selected.years.indexOf(year) >= 0;
						})
						.map(data => data.value);

					let color = 'rgba(223, 174, 57, ' + (1 - 0.3 * datasets.length) + ')';

					let newDataset = {
						label: indicator.name,
						data: data,
						color: color,
						unit: indicator.unit,
					};
					datasets.push(newDataset);
				}

				return datasets;
			},

			displayedIndicatorsLeft()
			{
				return this.indicators.filter((indicator) => {

					let matchSearch = true;
					let matchUnit = true;
					let hasData = indicator.data.length > 0;

					let objeto = JSON.stringify(indicator).toLowerCase();
					let search = this.search.indicator_left.toLowerCase().trim();

					if(objeto.indexOf(search) < 0) {
						matchSearch = false;
					}

					if (this.selected.indicators_left.length) {
						matchUnit = indicator.unit === this.selected.indicators_left[0].unit;
					}

					return matchSearch && matchUnit && hasData;

				});
			},

			displayedYears()
			{
				return this.years.filter((year) => {

					let matchSearch = true;

					let search = this.search.year.toLowerCase().trim();

					if(String(year).indexOf(search) < 0) {
						matchSearch = false;
					}

					return matchSearch;

				});
			},

			displayedIndicatorsRight()
			{
				return this.indicators.filter((indicator) => {

					let matchSearch = true;
					let matchUnit = true;
					let hasData = indicator.data.length > 0;

					let objeto = JSON.stringify(indicator).toLowerCase();
					let search = this.search.indicator_right.toLowerCase().trim();

					if(objeto.indexOf(search) < 0) {
						matchSearch = false;
					}

					if (this.selected.indicators_right.length) {
						matchUnit = indicator.unit === this.selected.indicators_right[0].unit;
					}

					return matchSearch && matchUnit && hasData;

				});
			},

		},

		mounted () {
			this.fetchIndicators();
		},

		methods: {
			fetchIndicators()
			{
				axios.get('/api/indicadores')
					.then(response => {
						this.indicators = response.data;
						this.parseYears();
					});
			},

			parseYears()
			{
				for (let indicator of this.indicators) {
					for (let data of indicator.data) {
						let year = Number(data.date.split('-')[0]);

						if (this.years.indexOf(year) < 0) {
							this.years.push(year);
							this.selected.years.push(year);
						}
					}
				}
			},

			parseReferences()
			{
				for (let indicator of this.selected.indicators) {
					let year = Number(data.date.split('-')[0]);

					if (this.years.indexOf(year) < 0) {
						this.years.push(year);
					}
				}
			}
		}
	}

</script>

<style scoped>

</style>
