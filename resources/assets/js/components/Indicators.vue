<template>
	<div>
		<div class="columns">

			<div class="column is-one-third">

				<div class="steps">
					<div class="step-number">
						1
					</div>
					<div class="description">
						Selecione pelo menos um indicador.
					</div>
				</div>

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
								:native-value="option"
								:disabled="(selected.left_column.length >= 4) && !isSelected(option, 'left')">

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

				<div class="steps">
					<div class="step-number">
						2
					</div>
					<div class="description">
						Selecione os anos que deseja visualizar.
					</div>
				</div>

				<div class="box is-bordered-danger indicator-control is-paddingless">
					<div class="header content is-marginless">
						<h3 class="title has-text-danger">
							Anos
						</h3>

						<div>
							<button class="button is-small is-light" @click="onSelectAllYears()">
								Selecionar todos
							</button>

							<button class="button is-small is-light" @click="onSelectNoYears()">
								Limpar seleção
							</button>
						</div>
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

				<div class="steps">
					<div class="step-number">
						3
					</div>
					<div class="description">
						Selecione outros indicadores ou referências para comparar.
					</div>
				</div>

				<div :class="{
					'box': true,
					'is-bordered-warning': true,
					'indicator-control': true,
					'is-paddingless': true
					}">

					<div class="header content is-marginless">

						<div class="reference-select has-text-centered">
							<button :class="{
									'button': true,
									'is-small': true,
									'is-warning': true,
									'has-text-weight-bold': true,
									'is-outlined': right_view !== 'indicator',
								}"
								@click="right_view = 'indicator'"
								:disabled="right_view !== 'indicator' && selected.right_column.length > 0">

								Indicadores

							</button>
							<button :class="{
									'button': true,
									'is-small': true,
									'is-warning': true,
									'has-text-weight-bold': true,
									'is-outlined': right_view !== 'reference',
								}"
								@click="right_view = 'reference'"
								:disabled="right_view !== 'reference' && selected.right_column.length > 0">

								Referências

							</button>

							<button :class="{
									'button': true,
									'is-small': true,
									'is-warning': true,
									'has-text-weight-bold': true,
									'is-outlined': right_view !== 'metric',
								}"
								@click="right_view = 'metric'"
								:disabled="right_view !== 'metric' && selected.right_column.length > 0">

								Métricas

							</button>
						</div>

						<p class="control has-icons-left">
							<input class="input is-small" type="text" placeholder="buscar" v-model="search.right_column">
							<span class="icon is-small is-left">
								<i class="fas fa-search" aria-hidden="true"></i>
							</span>
						</p>
					</div>
					<div class="body">
						<div v-for="option of displayedOptionsRight" class="field is-size-7" >

							<b-checkbox
								type="is-warning"
								v-model="selected.right_column"
								:native-value="option"
								:disabled="(selected.right_column.length >= 4) && !isSelected(option, 'right')">

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
					:labels="getSelectedYears.map(year => new Date(Number(year), 0, 1))"
					:axis_left="{
						gridLines: {
							color: 'rgb(82, 161, 212)'
						},
						ticks: {
							fontSize: 14,
						},
					}"
					:axis_right="{
						gridLines: {
							color: 'rgb(223, 174, 57)',
							drawOnChartArea: getDatasetsLeft.length ? false : true,
						},
					}"
					:axis_bottom="{
						type: 'time',
						time: {
		                    unit: 'year'
		                },
						ticks: {
							fontSize: 14,
						}
					}"
					:datasets_left="getDatasetsLeft"
					:datasets_right="getDatasetsRight"
					:display_legend="true"
					:big_font="true">
				</chart-new>
			</div>
		</div>

		<div class="buttons">
			<a
				href=""
				id="download-button"
				download="mobilidadebh-grafico.png"
				class="button is-info is-outlined"
				@click="onChartDownload()">

				<b-icon icon="download" size="is-small"></b-icon>
				<span>Baixar gráfico</span>

			</a>

			<a class="button is-info is-outlined" @click="onChartShare('twitter')">
				<span class="icon">
					<i class="fab fa-twitter"></i>
				</span>
			</a>

			<a class="button is-info is-outlined" @click="onChartShare('facebook')">
				<span class="icon">
					<i class="fab fa-facebook"></i>
				</span>
			</a>

			<a class="button is-info is-outlined" @click="onChartShare('link')" slot="trigger">
				<span class="icon">
					<i class="fas fa-link"></i>
				</span>
			</a>

		</div>

		<div v-if="share_url.length">
			<b-field position="is-centered">
				<b-input v-model="share_url" type="text" icon="link" size="is-small" id="share-url">
				</b-input>
				<p class="control">
					<b-tooltip label="Copiar link"
						type="is-light"
						position="is-right">
						<button class="button is-info is-small" @click="onLinkCopy()">
							<span class="icon">
								<i class="fas fa-copy"></i>
							</span>
						</button>
					</b-tooltip>
				</p>
			</b-field>
		</div>

	</div>
</template>

<script>
	export default {

		data() {
			return {
				colors_blue: ['#1D2951', '#1034A6', '#6593F5', '#57A0D3', '#95C8D8'],
				indicators: [],
				metrics: [],
				references: [],
				right_view: 'indicator',
				share_url: '',
				search: {
					left_column: '',
					right_column: '',
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

					let color = this.colors_blue[datasets.length];

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
				if (this.selected.left_column.length === 5) {
					return;
				}

				return this.indicators.filter((indicator) => {

					let matchSearch = true;
					let matchUnit = true;
					let hasData = indicator.data.length > 0;
					let isSelected = this.selected.right_column.findIndex((option) => {
						return (indicator.alias === option.alias);
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
				if (this.selected.right_column.length === 5) {
					return;
				}

				let options = null;
				if (this.right_view === 'indicator') options = this.indicators;
				else if (this.right_view === 'reference') options = this.references;
				else if (this.right_view === 'metric') options = this.metrics;

				return options.filter((option) => {

					let matchUnit = true;
					let matchSearch = true;
					let hasData = option.data.length > 0;
					let isSelected = this.right_view === 'indicator' ? this.selected.left_column.findIndex(indicator => option.id === indicator.id) >= 0 : false;
					let matchReference = this.right_view === 'reference' ? (option.indicator_id === null) || (this.selected.left_column.findIndex(indicator => option.indicator_id === indicator.id) >= 0) : true;

					let objeto = JSON.stringify(option).toLowerCase();
					let search = this.search.right_column.toLowerCase().trim();

					if(objeto.indexOf(search) < 0) {
						matchSearch = false;
					}

					if (this.selected.right_column.length && this.right_view === 'indicator') {
						matchUnit = option.unit === this.selected.right_column[0].unit;
					} else if (this.selected.left_column.length && this.right_view === 'reference') {
						matchUnit = option.unit === this.selected.left_column[0].unit;
					}

					return matchSearch && matchUnit && hasData && !isSelected && matchReference;

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
					return (start_year <= year) && (year <= end_year);
				});
			},

		},

		mounted () {
			this.fetchIndicators();
			this.fetchMetrics();
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

			fetchMetrics()
			{
				axios.get('/api/metricas')
					.then(response => {
						this.metrics = response.data;
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

			isSelected(option, column) {
				if (column === 'left') {
					return this.selected.left_column.findIndex(selected => {
						return selected.id === option.id;
					}) >= 0;
				} else {
					return this.selected.right_column.findIndex(selected => {
						return selected.id === option.id;
					}) >= 0;
				}
			},

			onChartDownload()
			{
				let url = document.getElementById('line-chart').toDataURL();
				document.getElementById('download-button').href = url;
			},

			onChartShare(network)
			{
				let url = document.getElementById('line-chart').toDataURL().replace(/^data:image\/(png|jpg);base64,/, '');

				axios.post('/graficos', {chart: url})
					.then(response => {
						if (network === 'twitter') {
							var text = 'Conheça, compreenda e avalie o Plano de Mobilidade Urbana de BH - ​#PlanMobBH! \n' + response.data;
							var win = window.open('https://twitter.com/intent/tweet?text=' + encodeURIComponent(text) + '&via=nossabh', '_blank');
							if(win !== null && typeof(win) !== 'undefined') {
								event.preventDefault();
								win.focus();
							}
						} else if (network === 'facebook') {
							var win = window.open('https://www.facebook.com/dialog/share?app_id=390669861344505&display=popup&href=' + encodeURIComponent(response.data) + '&redirect_uri=' + encodeURIComponent(window.location.href), '_blank');
							if (win !== null && typeof(win) !== 'undefined') {
								event.preventDefault();
								win.focus();
							}
						} else if (network === 'link') {
							this.share_url = response.data;
							setTimeout(() => {
								document.getElementById("share-url").select();
							}, 100);
						}
					});
			},

			onLinkCopy() {
				this.$copyText(this.share_url).then(function (e) {
					alert('Link copiado!')
					console.log(e)
				}, function (e) {
					alert('Erro ao copiar link.')
					console.log(e)
				});
			},

			onSelectAllYears() {
				this.selected.years = _.clone(this.displayedYears);
			},

			onSelectNoYears() {
				this.selected.years = [];
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

				for (let metric of this.metrics) {
					for (let data of metric.data) {
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

	.reference-select {
		margin-bottom: 0.5rem;
	}

	.buttons {
		justify-content: center;
	}
</style>
