@extends('fe.layout.layout')

@section('contents')
<div class="wrapper box-layout">
    <!-- breadcrumb area start -->
    <div class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-wrap">
                        <nav aria-label="breadcrumb">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ Route('home') }}">Home</a></li>
                                <li class="breadcrumb-item"><a href="{{ Route('shop') }}">Shop</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Check Out</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb area end -->

    <div class="checkout-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-12">
                        <h5>{{ $notification }}</h5>
                        <a href="{{ Route('shop') }}" class="primary-btn mt-5">Continue Shoppping</a>
                    </div>
                </div>
            </div>
        </div>
    </div>    
</div>
@endsection


