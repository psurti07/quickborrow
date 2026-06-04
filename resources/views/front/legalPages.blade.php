@extends('layouts.front')
@push('css')
@endpush
@push('style-css')
@endpush
@section('content')
<section class="page-hero-section">
    <div class="page-hero-section-overlay bg--green-100 bg--scroll">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="left-column">
                        <h2 class="s-28 mb-5">{{ $mainTitle }}</h2>
                        <p class="s-16 mt-0">{{ $subTitle }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section id="privacy-page" class="gr--white py-80 division">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <div class="border p-4 r-12">
                    {!! $description !!}
                </div>
            </div>
        </div>
    </div>
</section>
<hr class="divider" />
@endsection
@push('script-src')
@endpush
@push('scripts')
@endpush