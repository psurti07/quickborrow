@extends('layouts.selfapply')
@push('css')
<link href="{{ asset('front/css/custom.css') }}" rel="stylesheet" type="text/css" />
<style>
    .bank-crousel {
        display: block !important;
    }
    .owl-carousel .owl-item img {
        width: 80% !important;
    }
    .testimonials-carousel .owl-item img {
        width: 100% !important;
    }
</style>
@endpush
@section('content')
<section id="contacts" class="gr--white personal-details-form pb-100 inner-page-hero contacts-section division">
    <div class="container">
        <div class="row justify-content-center">
            <div class="row mb-35 align-items-center justify-content-center m-auto">
                <div class="col-lg-6 col-md-12 col-sm-12">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-12 align-items-center justify-content-center m-auto">
                            <div class="card bg--06">
                                <div class="card-body">
                                    <div class="row">
                                        {{-- FIXED: Use boolean check instead of string comparison --}}
                                        <h4 class="fw-bolder text-{{ $response ? 'success' : 'danger' }} text-center">
                                            <span class="flaticon-idea"></span>&nbsp;&nbsp;Payment {{ $response ? 'Successful' : 'Failed' }}
                                        </h4>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-12 text-center">
                                            <p class="color--grey text-{{ $response ? 'success' : 'danger' }}">
                                                {{ $response ? 'Great! You\'ve taken your smart step towards expert loan consultation.' : 'We regret to inform you that your payment for Subscription Plan was not successful.' }}
                                            </p>
                                        </div>
                                        <div class="col-md-12 text-center mt-2">
                                            <p class="color--grey text-{{ $response ? 'success' : 'danger' }}">
                                                {{ $response ? 'Kindly check your E-mail & WhatsApp for further process.' : 'We request you to try another payment method.' }}
                                            </p>
                                        </div>
                                    </div>
                                    
                                    {{-- FIXED: Use boolean check instead of string comparison --}}
                                    @if($response)
                                    <div class="text-center mb-20">
                                        <div class="row gy-2 gx-2">
                                            <div class="col-lg-4 col-md-4 col-12">
                                                <div class="border rounded-3 p-2 bg--green-200">
                                                    <p class="s-14 fw-bold mb-2">Customer Portal</p>
                                                    <p class="s-14">Your service is active. Log in to the portal.</p>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-12">
                                                <div class="border rounded-3 p-2 bg--green-200">
                                                    <p class="s-14 fw-bold mb-2">Invoice</p>
                                                    <p class="s-14">Invoice is available for download in portal.</p>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-12">
                                                <div class="border rounded-3 p-2 bg--green-200">
                                                    <p class="s-14 fw-bold mb-2">Consultant</p>
                                                    <p class="s-14">Our team will contact you within 24 hrs.</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    @else
                                    <div class="text-center mb-20">
                                        <p class="color--grey text-danger">Common Reasons for Payment Failure:</p>
                                        <div class="row gy-2 gx-2">
                                            <div class="col-lg-4 col-md-4 col-12">
                                                <div class="border rounded-3 p-2 bg--red-100">
                                                    <p class="s-14 fw-bold mb-2">Card Issue</p>
                                                    <p class="s-14">Insufficient balance or card limit exceeded.</p>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-12">
                                                <div class="border rounded-3 p-2 bg--red-100">
                                                    <p class="s-14 fw-bold mb-2">Network</p>
                                                    <p class="s-14">Connection timeout or bank service issue.</p>
                                                </div>
                                            </div>
                                            <div class="col-lg-4 col-md-4 col-12">
                                                <div class="border rounded-3 p-2 bg--red-100">
                                                    <p class="s-14 fw-bold mb-2">Cancelled</p>
                                                    <p class="s-14">Transaction was cancelled by user.</p>
                                                </div>
                                            </div>
                                        </div>
                                        <p class="mt-20 mb-0 small text-danger">Don't worry! No amount has been deducted from your account.</p>
                                    </div>
                                    @endif

                                    <div class="row mt-3">
                                        <span id="timer" class="s-14 color--grey text-{{ $response ? 'success' : 'danger' }} text-center"></span>
                                        <hr class="divider my-3" />
                                        <span class="text-center s-12">If you've any queries/ issues, kindly raise a request here: <a href="{{ route('front.raise.request') }}" class="text-success fw-bold">Click Here</a></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section id="integrations-2" class="py-80 integrations-section">
    <div class="container">
        <div class="r-12 text-center">
            <div class="row justify-content-center">
                <div class="col-md-12 col-lg-12">
                    <div class="section-title mb-50">
                        <h2 class="s-34 w-700">Going Strong With Stronger Recommendations!</h2>
                        <p class="s-16 color--grey">Our guidance will drive you towards the best NBFC personalized offers.</p>
                    </div>
                </div>
            </div>
            @php
            $lists = nbfcsList();
            @endphp
            <div class="bank-crousel">
                <div class="row">
                    <div class="col text-center">
                        <div class="owl-carousel brands-carousel-6 emi-carousel">
                            {!! $lists['carousel'] !!}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
@endsection
@push('scripts')
<script>
    $(document).ready(function() {
        $(".banks-carousel").owlCarousel({
            items: 2,
            loop: true,
            autoplay: true,
            navBy: 1,
            dots: false,
            autoplayTimeout: 4500,
            autoplayHoverPause: true,
            smartSpeed: 1500,
            responsive: {
                0: { items: 1 },
                767: { items: 1 },
                768: { items: 2 },
                991: { items: 3 },
                1000: { items: 3 }
            }
        });

        $(".testimonials-carousel").owlCarousel({
            items: 2,
            loop: true,
            autoplay: true,
            navBy: 1,
            dots: false,
            autoplayTimeout: 4500,
            autoplayHoverPause: true,
            smartSpeed: 1500,
            responsive: {
                0: { items: 1 },
                767: { items: 1 },
                768: { items: 2 },
                991: { items: 3 },
                1000: { items: 3 }
            }
        });
    });
</script>
@endpush