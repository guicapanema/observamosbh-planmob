@extends('layouts.app')

@section('content')
	<img src="/img/contato.jpg" style="margin-bottom: -10px" class="top-image"></img>

	<section class="section notification is-light is-marginless has-border-ripped">
		<div class="container">
			<div class="columns is-vcentered content">
				<div class="column is-one-third">
					<img src="/img/grafismo-amarelo.png" class="grafismo is-rotated-180"></img>
					<h2 class="has-text-weight-bold has-margin-top-100">Entre em contato</h2>
					<p>Qualquer dúvida, envie e-mail para o Nossa BH ou preencha o formulário:</p>
					<img src="/img/grafismo-amarelo.png" class="grafismo"></img>
				</div>
				<form class="column is-two-thirds" method="POST" action="/contato">
					{{ csrf_field() }}
					<div class="field">
						<label class="label">Nome</label>
						<div class="control has-icons-left">
							<input class="input{{ $errors->has('nome') ? ' is-danger' : '' }}" type="text" id="nome" name="nome" placeholder="Digite seu nome" value="{{ old('nome') }}">
							<span class="icon is-small is-left">
								<i class="fas fa-user"></i>
							</span>
						</div>
						@if ($errors->has('nome'))<p class="help is-danger">Por favor, digite seu nome</p>@endif
					</div>

					<div class="field">
						<label class="label">Email</label>
						<div class="control has-icons-left">
							<input class="input{{ $errors->has('email') ? ' is-danger' : '' }}" type="email" id="email" name="email" placeholder="Digite seu email" value="{{ old('email') }}">
							<span class="icon is-small is-left">
								<i class="fas fa-envelope"></i>
							</span>
						</div>
						@if ($errors->has('email'))<p class="help is-danger">Por favor, digite um e-mail válido</p>@endif

					</div>

					<div class="field">
						<label class="label">Mensagem</label>
						<div class="control">
							<textarea class="textarea{{ session('success') ? ' is-success' : '' }}{{ $errors->has('mensagem') ? ' is-danger' : '' }}" id="mensagem" name="mensagem" placeholder="Digite sua mensagem">{{ old('mensagem') }}</textarea>
						</div>
						@if (session('success'))<p class="help is-success">Mensagem enviada com sucesso!</p>@endif
						@if ($errors->has('mensagem'))<p class="help is-danger">Por favor, digite uma mensagem</p>@endif
					</div>

					<div class="field field-message">
						<label class="label" for="message">Deixe vazio</label>
						<div class="control">
							<input id="message" name="message" value="{{ old('message') }}" />
						</div>
					</div>

					<div class="field is-pulled-right">
						<div class="control">
							<button type="submit" class="button is-warning">Enviar</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>

	<section class="section notification is-warning is-marginless">
		<div class="container content has-padding-top-200">
			<h1 class="title has-text-centered has-text-weight-bold">Dúvidas frequentes</h1>
			<div class="columns">
				<div class="column is-half">
					<p>
						<h4>Mas como fazer a diferença sem participar dos instrumentos mais formais de participação?</h4>
						<p>Há também aplicativos que ajudam a angariar informações e avaliar o transporte como o MoveCidade e Colab, dê uma pesquisada!</p>
					</p>
					<p>
						<h4>Gostei da atuação dos movimentos, onde posso encontrar mais informações?</h4>
						<p>Mande mensagem nos sites e nas páginas de Facebook: <a href="http://nossabh.org.br" target="_blank">nossabh.org.br</a>, <a href="http://bhemciclo.org" target="_blank">bhemciclo.org</a>, <a href="http://tarifazerobh.org" target="_blank">tarifazerobh.org</a>, <a href="http://desvelocidades.red" target="_blank">desvelocidades.red</a>.</p>
					</p>
					<p>
						<h4>Tem algo que eu possa fazer sozinho ou tudo depende da Prefeitura?</h4>
						<p><strong>Seja criativo!</strong> Há várias formas de ação direta. Pense em organizar uma vaga viva na porta da sua casa, organize bondes a pé ou de bike para escola ou trabalho, faça uma bicicletada, faça intervenções, reinvente o dia a dia da cidade.</p>
					</p>
					<p>
						<h4>O que aconteceria se a temperatura subisse apenas meio 0,5° C?</h4>
						<p>A revista Nature, <a href="http://www.nature.com/nclimate/journal/v7/n7/full/nclimate3320.html">publicou</a> um estudo de uma pesquisa que examinou o período entre 1960-1979 e, depois, de 1991 a 2010, quando a temperatura média já havia subido 0,5oC. Os resultados foram preocupantes: a frequência das chuvas fortes aumentou 10% sobre um quarto da superfície do planeta; as secas duraram uma semana a mais em mais da metade do mundo; as temperaturas variaram mais, chegando a subir 1oºC no verão e 2,5ºC no inverno.</p>
					</p>
				</div>
				<div class="column is-half">
					{{-- <p>
						<h4>Gases de efeito estufa e poluentes locais são a mesma coisa?</h4>
						<p>Dolor sit amet, consectetur adipiscing elit. Nulla accumsan, metus ultrices eleifend gravida, nulla nunc varius lectus, nec rutrum justo nibh eu lectus.</p>
					</p> --}}
					<p>
						<h4>Mitigação, adaptação e resiliência… o que é isso?</h4>
						<p>A mitigação é a capacidade de reduzir as emissões de maneira significativa e até mesmo de remover, ou “sequestrar”, os GEE da atmosfera, sendo então o foco principal das ações de mudança climática. No entanto, as medidas de mitigação já são insuficientes para impedir uma mudança do clima no futuro. Nesse contexto, apresentam-se as ações de adaptação, que são ajustes de diversos tipos para a convivência com uma nova realidade, mais quente. Uma das grandes preocupações está ligada às alterações no regime das chuvas, causando impacto em cidades como Belo Horizonte.</p>
						<p>Por sua vez, a resiliência é a capacidade de lidar com eventos extremos, como o aumento do nível das chuvas, por meio do planejamento e da gestão, procurando evitar os danos dos impactos negativos e criando maneiras de conviver com a nova realidade sem prejudicar a qualidade de vida das pessoas.</p>
					</p>
					<p>
						<h4>O que é um inventário de emissões de GEE?</h4>
						<p>Como todo inventário, trata-se de um levantamento exaustivo, neste caso de tudo que emite GEE. Para que cada tipo de gás de efeito estufa seja comparado e para facilitar as contas e o entendimento, transforma-se tudo em uma mesma unidade: CO2 equivalente (CO2eq). Nessa transformação, os gases mais poluentes que o dióxido de carbono são contados com “unidades de CO2”. Exemplo: se o gás metano que sai do lixo é quatro vezes pior, cada grama de metano é contado como 4 gramas de CO2 equivalente.</p>
					</p>
					<p>
						<h4>Achei os planos bem legais e completos, mas não vejo nenhuma ações dessas na prática, por que isso acontece?</h4>
						<p>Os planos existem e têm boas intenções, mas ainda falta muito para se tornarem realidade em BH, por diversos motivos. O principal deles é que o processo de construção de uma cidade para automóveis ainda mantém sua inércia, inclusive nos espaços construídos (as ruas). Outros motivos estão na falta de etapas importantes do processo de planejamento defendido nesta ficha-resumo: a falta de um adequado desdobramento das ações em recursos no orçamento municipal e a necessidade de monitoramento e controle social mais fortes.</p>
					</p>
				</div>
			</div>
		</div>
	</section>
@endsection
