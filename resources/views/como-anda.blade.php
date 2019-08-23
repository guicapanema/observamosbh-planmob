@extends('layouts.app')

@section('content')
	<section class="section is-marginless">
		<div class="container">
			<div class="columns is-centered">
				<div class="column is-8">
					@foreach ($posts as $post)
						<div class="post content">


							<div class="category">
								{!! implode(', ', $post->terms['category']) !!}
							</div>

							<h2 class="title has-text-centered">
								<span class="has-underline-dashed-primary">
									{!! $post->title !!}
								</span>
							</h2>

							<div class="date">
								{{ $post->post_date->format('j\/n\/Y') }}
							</div>

							@if ($post->thumbnail !== null)
								<div class="columns is-centered post-image">
									<div class="column is-8">
										<figure class="image is-16by9">
											<img src="{{ $post->thumbnail->size('planmob-thumbnail')['url'] }}">
										</figure>
									</div>
								</div>
							@endif

							@if ( Request::is('como-anda/*') )

								{!! $post->content !!}

							@else

								<p>
									@if (strlen($post->excerpt) > 0)
										{{ $post->excerpt }}
									@else
										{{ \Illuminate\Support\Str::words(strip_tags($post->content), 100, '...') }}
									@endif
								</p>

								<div class="has-text-centered read-more">
									<a href="/como-anda/{{ $post->post_name }}" class="button is-primary has-text-weight-semibold">
										Leia mais...
									</a>
								</div>
							@endif


						</div>
					@endforeach

					@if ( !Request::is('como-anda/*') )

						{!! $posts->links() !!}

					@endif

				</div>
			</div>
		</div>
	</section>
@endsection
