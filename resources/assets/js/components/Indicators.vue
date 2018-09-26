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
							<input class="input is-small" type="text" placeholder="buscar" v-model="search.left_column">
							<span class="icon is-small is-left">
								<i class="fas fa-search" aria-hidden="true"></i>
							</span>
						</p>
					</div>
					<div class="body">
						<div v-for="option of displayedOptionsLeft" class="field is-size-7" >
							<b-checkbox type="is-info"
								v-model="selected.left_column"
								:native-value="option">

								{{ option.name }}

							</b-checkbox>
						</div>
						<div v-if="displayedOptionsLeft.length === 0" class="is-size-7 has-text-grey">
							Nenhum resultado corresponde aos Filtros
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
						<div v-if="displayedYears.length === 0" class="is-size-7 has-text-grey">
							Selecione pelo menos um indicador
						</div>
					</div>
				</div>
			</div>

			<div class="column is-one-third">
				<div class="box is-bordered-warning indicator-control is-paddingless">
					<div class="header content is-marginless">
						<b-dropdown class="right-column-switch">
							<button class="button is-warning is-outlined has-text-weight-bold" slot="trigger">
								<span v-if="right_view === 'indicator'">Indicadores</span>
								<span v-else>Referências</span>
								<b-icon icon="caret-down"></b-icon>
							</button>

							<b-dropdown-item
								v-if="right_view === 'indicator'"
								@click="right_view = 'reference'">
								Referências
							</b-dropdown-item>
							<b-dropdown-item
								v-else
								@click="right_view = 'indicator'">
								Indicadores
							</b-dropdown-item>
						</b-dropdown>
						<!-- <h3 class="title has-text-warning">
							Indicadores
						</h3> -->

						<p class="control has-icons-left">
							<input class="input is-small" type="text" placeholder="buscar" v-model="search.right_column">
							<span class="icon is-small is-left">
								<i class="fas fa-search" aria-hidden="true"></i>
							</span>
						</p>
					</div>
					<div class="body">
						<div v-for="option of displayedOptionsRight" class="field is-size-7" >
							<b-checkbox type="is-warning"
								v-model="selected.right_column"
								:native-value="option">

								{{ option.name }}

							</b-checkbox>
						</div>

						<div v-if="displayedOptionsRight.length === 0" class="is-size-7 has-text-grey">
							Nenhum resultado corresponde aos Filtros
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="columns is-centered">
			<div class="column is-8">
				<chart-new
					:labels="getSelectedYears"
					:datasets_left="getDatasetsLeft"
					:datasets_right="getDatasetsRight"
					:display_legend="true">
				</chart-new>
			</div>
		</div>

		<div class="has-text-centered">
			<a
				href=""
				id="download-button"
				download="mobilidadebh-grafico.png"
				class="button is-info is-outlined"
				@click="onChartDownload()">

				<b-icon icon="download" size="is-small"></b-icon>
				<span>Baixar gráfico</span>

			</a>
		</div>

	</div>
</template>

<script>
	export default {

		data() {
			return {
				indicators: [],
				references: [],
				right_view: 'reference',
				search: {
					left_column: '',
					right_column: '',
					year: '',
				},
				selected: {
					left_column: [],
					right_column: [],
					years: [],
				},
				years: [],
			}
		},

		computed: {

			getDatasetsLeft()
			{
				let datasets = [];

				for (let indicator of this.selected.left_column) {
					let data = Array(this.selected.years.length).fill(null);

					for (let inner_data of indicator.data) {
						let year = Number(inner_data.date.split('-')[0]);
						let index = this.getSelectedYears.indexOf(year);
						if (index >= 0) {
							data[index] = inner_data.value;
						}
					}

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

				for (let selection of this.selected.right_column) {
					let data = Array(this.selected.years.length).fill(null);

					for (let inner_data of selection.data) {
						let year = Number(inner_data.date.split('-')[0]);
						let index = this.getSelectedYears.indexOf(year);
						if (index >= 0) {
							data[index] = inner_data.value;
						}
					}

					let color = 'rgba(223, 174, 57, ' + (1 - 0.3 * datasets.length) + ')';

					let newDataset = {
						label: selection.name,
						data: data,
						color: color,
						unit: selection.unit,
					};
					datasets.push(newDataset);
				}

				return datasets;
			},

			getSelectedYears()
			{
				let start_year = null;
				let end_year = null;

				for ( let selection of this.selected.left_column.concat(this.selected.right_column) ) {
					let first_year = Number(selection.data[0].date.split('-')[0]);
					let last_year = Number(selection.data[selection.data.length - 1].date.split('-')[0]);

					if (!start_year || first_year < start_year) start_year = first_year;
					if (!end_year || last_year > end_year) end_year = last_year;
				}

				let selected_years = _.clone(this.selected.years).sort().filter((selected_year) => {
					let match = true;
					if ( start_year && (selected_year < start_year) ) match = false;
					if ( end_year && (selected_year > end_year) ) match = false;
					return match;
				});

				return selected_years;
			},

			displayedOptionsLeft()
			{
				return this.indicators.filter((indicator) => {

					let matchSearch = true;
					let matchUnit = true;
					let hasData = indicator.data.length > 0;
					let isSelected = this.selected.right_column.findIndex((option) => {
						return (option.datable_type === 'App\\Indicator') && (indicator.id === option.id);
					}) >= 0;

					let objeto = JSON.stringify(indicator).toLowerCase();
					let search = this.search.left_column.toLowerCase().trim();

					if(objeto.indexOf(search) < 0) {
						matchSearch = false;
					}

					if (this.selected.left_column.length) {
						matchUnit = indicator.unit === this.selected.left_column[0].unit;
					}

					return matchSearch && matchUnit && hasData && !isSelected;

				});
			},

			displayedOptionsRight()
			{
				let options = null;
				if (this.right_view === 'indicator') options = this.indicators;
				else options = this.references;

				return options.filter((option) => {

					let matchSearch = true;
					let matchUnit = true;
					let hasData = option.data.length > 0;
					let isSelected = this.right_view === 'indicator' ? this.selected.left_column.findIndex(indicator => option.id === indicator.id) >= 0 : false;

					let objeto = JSON.stringify(option).toLowerCase();
					let search = this.search.right_column.toLowerCase().trim();

					if(objeto.indexOf(search) < 0) {
						matchSearch = false;
					}

					if (this.selected.right_column.length) {
						matchUnit = option.unit === this.selected.right_column[0].unit;
					}

					return matchSearch && matchUnit && hasData && !isSelected;

				});
			},

			displayedYears()
			{
				let start_year = null;
				let end_year = null;

				for ( let selection of this.selected.left_column.concat(this.selected.right_column) ) {
					let first_year = Number(selection.data[0].date.split('-')[0]);
					let last_year = Number(selection.data[selection.data.length - 1].date.split('-')[0]);

					if (!start_year || first_year < start_year) start_year = first_year;
					if (!end_year || last_year > end_year) end_year = last_year;
				}

				return this.years.filter((year) => {

					let matchSearch = true;

					let search = this.search.year.toLowerCase().trim();

					if (String(year).indexOf(search) < 0) {
						matchSearch = false;
					}

					return matchSearch && (start_year <= year) && (year <= end_year);

				});
			},

		},

		mounted () {
			this.fetchIndicators();
			this.fetchReferences();
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

			fetchReferences()
			{
				axios.get('/api/referencias')
					.then(response => {
						this.references = response.data;
						this.parseYears();
					});
			},

			onChartDownload()
			{
				let url = document.getElementById('line-chart').toDataURL();
				document.getElementById('download-button').href = url;
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

				for (let reference of this.references) {
					for (let data of reference.data) {
						let year = Number(data.date.split('-')[0]);

						if (this.years.indexOf(year) < 0) {
							this.years.push(year);
							this.selected.years.push(year);
						}
					}
				}

				this.years.sort();
			},
		}
	}

</script>

<style scoped>
	.right-column-switch {
		margin-top: -0.50em;
		margin-bottom: 0.50em;
	}
</style>
