@if ($paginator->hasPages())
    <ul class="pagination">
        {{-- Previous Page Link --}}
        @if ($paginator->onFirstPage())
            <li><span class="button is-small is-primary is-outlined" disabled>&laquo;</span></li>
        @else
            <li><a href="{{ $paginator->previousPageUrl() }}" rel="prev" class="button is-small is-primary is-outlined">&laquo;</a></li>
        @endif

        {{-- Pagination Elements --}}
        @foreach ($elements as $element)
            {{-- "Three Dots" Separator --}}
            @if (is_string($element))
                <li class="disabled"><span>{{ $element }}</span></li>
            @endif

            {{-- Array Of Links --}}
            @if (is_array($element))
                @foreach ($element as $page => $url)
                    @if ($page == $paginator->currentPage())
                        <li class="active"><span class="button is-small is-primary has-text-weight-semibold" disabled>{{ $page }}</span></li>
                    @else
                        <li><a href="{{ $url }}" class="button is-small is-primary is-outlined">{{ $page }}</a></li>
                    @endif
                @endforeach
            @endif
        @endforeach

        {{-- Next Page Link --}}
        @if ($paginator->hasMorePages())
            <li><a href="{{ $paginator->nextPageUrl() }}" rel="next" class="button is-small is-primary is-outlined">&raquo;</a></li>
        @else
            <li><span class="button is-small is-primary is-outlined" disabled>&raquo;</span></li>
        @endif
    </ul>
@endif
