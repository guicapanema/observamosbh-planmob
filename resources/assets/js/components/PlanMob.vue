<template>
	<div class="columns">
		<div class="column is-one-fifth">
			<nav class="panel">
				<p class="panel-heading">
					Filtros
				</p>
				<div class="panel-block">
					<p class="control has-icons-left">
						<input class="input is-small" type="text" placeholder="buscar">
						<span class="icon is-small is-left">
							<i class="fa fa-search"></i>
						</span>
					</p>
				</div>
				<p class="panel-tabs">
					<a class="is-active">modais</a>
					<!-- <a>public</a>
					<a>private</a> -->
				</p>
				<a class="panel-block">
					<span class="panel-icon">
						<i class="fa fa-female"></i>
					</span>
					pedestre
				</a>
				<a class="panel-block is-active">
					<span class="panel-icon">
						<i class="fa fa-bicycle"></i>
					</span>
					bicicleta
				</a>
				<a class="panel-block">
					<span class="panel-icon">
						<i class="fa fa-bus"></i>
					</span>
					ônibus
				</a>
				<a class="panel-block">
					<span class="panel-icon">
						<i class="fa fa-subway"></i>
					</span>
					metrô
				</a>
				<a class="panel-block">
					<span class="panel-icon">
						<i class="fa fa-truck"></i>
					</span>
					logística
				</a>
				<a class="panel-block">
					<span class="panel-icon">
						<i class="fa fa-car"></i>
					</span>
					motorizado individual
				</a>
				<div class="panel-block">
					<button class="button is-link is-outlined is-fullwidth">
						limpar todos os filtros
					</button>
				</div>
			</nav>
		</div>
		<div class="column">
			<h1 class="subtitle">Eixos</h1>
			<article class="media box">
				<figure class="media-left">
					<p class="image is-64x64">
						<img src="img/bicycle.png">
					</p>
				</figure>
				<div class="media-content">
					<div class="content">
						<p>
							<strong>Mobilidade Ativa</strong>
							<br>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare magna eros, eu pellentesque tortor vestibulum ut. Maecenas non massa sem. Etiam finibus odio quis feugiat facilisis.
						</p>
					</div>
					<nav class="level is-mobile">
						<div class="level-left">
							<div class="tags">
								<span class="tag is-info">pedestre</span>
								<span class="tag is-info">bicicleta</span>
							</div>
						</div>
					</nav>
				</div>
				<div class="media-right">
					<small>8 <i class="fas fa-cogs"></i></small> <br />
					<small>3 <i class="fas fa-chart-line"></i></small>
				</div>
			</article>

			<article class="media box">
				<figure class="media-left">
					<p class="image is-64x64">
						<img src="img/park.png">
					</p>
				</figure>
				<div class="media-content">
					<div class="content">
						<p>
							<strong>Circulação Calma</strong>
							<br>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare magna eros, eu pellentesque tortor vestibulum ut. Maecenas non massa sem. Etiam finibus odio quis feugiat facilisis.
						</p>
					</div>
					<nav class="level is-mobile">
						<div class="level-left">
							<div class="tags">
								<span class="tag is-info">lorem</span>
								<span class="tag is-info">ipsum</span>
							</div>
						</div>
					</nav>
				</div>
				<div class="media-right">
					<small>5 <i class="fas fa-cogs"></i></small> <br />
					<small>2 <i class="fas fa-chart-line"></i></small>
				</div>
			</article>

			<article class="media box">
				<figure class="media-left">
					<p class="image is-64x64">
						<img src="img/train.png">
					</p>
				</figure>
				<div class="media-content">
					<div class="content">
						<p>
							<strong>Mobilidade Coletiva</strong>
							<br>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare magna eros, eu pellentesque tortor vestibulum ut. Maecenas non massa sem. Etiam finibus odio quis feugiat facilisis.
						</p>
					</div>
					<nav class="level is-mobile">
						<div class="level-left">
							<div class="tags">
								<span class="tag is-info">ônibus</span>
								<span class="tag is-info">metrô</span>
							</div>
						</div>
					</nav>
				</div>
				<div class="media-right">
					<small>5 <i class="fas fa-cogs"></i></small> <br />
					<small>2 <i class="fas fa-chart-line"></i></small>
				</div>
			</article>

			<article class="media box">
				<figure class="media-left">
					<p class="image is-64x64">
						<img src="img/truck.png">
					</p>
				</figure>
				<div class="media-content">
					<div class="content">
						<p>
							<strong>Logística Urbana</strong>
							<br>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare magna eros, eu pellentesque tortor vestibulum ut. Maecenas non massa sem. Etiam finibus odio quis feugiat facilisis.
						</p>
					</div>
					<nav class="level is-mobile">
						<div class="level-left">
							<div class="tags">
								<span class="tag is-info">carro</span>
								<span class="tag is-info">moto</span>
							</div>
						</div>
					</nav>
				</div>
				<div class="media-right">
					<small>5 <i class="fas fa-cogs"></i></small> <br />
					<small>2 <i class="fas fa-chart-line"></i></small>
				</div>
			</article>

			<article class="media box">
				<figure class="media-left">
					<p class="image is-64x64">
						<img src="img/car.png">
					</p>
				</figure>
				<div class="media-content">
					<div class="content">
						<p>
							<strong>Mobilidade Individual Motorizada</strong>
							<br>
							Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ornare magna eros, eu pellentesque tortor vestibulum ut. Maecenas non massa sem. Etiam finibus odio quis feugiat facilisis.
						</p>
					</div>
					<nav class="level is-mobile">
						<div class="level-left">
							<div class="tags">
								<span class="tag is-info">carro</span>
								<span class="tag is-info">moto</span>
							</div>
						</div>
					</nav>
				</div>
				<div class="media-right">
					<small>5 <i class="fas fa-cogs"></i></small> <br />
					<small>2 <i class="fas fa-chart-line"></i></small>
				</div>
			</article>

		</div>
		<div class="column">
			<h1 class="subtitle">Indicadores</h1>
			<div class="box">
				Taxa de mortalidade em acidentes de trânsito
			</div>
			<div class="box">
				Toneladas de CO2 emitidas por habitante
			</div>
			<div class="box">
				Percentual de viagens a pé
			</div>
		</div>
	</div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
