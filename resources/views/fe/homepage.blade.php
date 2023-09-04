@extends('fe.layout.layout')

@section('contents')
<div id="friendCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <!-- Fetch indicators dynamically from the database -->
        @foreach ($sliders as $index => $slide)
        <li data-target="#friendCarousel" data-slide-to="{{ $index }}" class="{{ $index == 0 ? 'active' : '' }}"></li>
        @endforeach
    </ol>

    <!-- Slides -->
    <div class="carousel-inner">
        <!-- Fetch slides dynamically from the database -->
        @foreach ($sliders as $index => $slide)
        <div class="carousel-item {{ $index == 0 ? 'active' : '' }}">
            <a href="{{ $slide->link }}">
                <img class="d-block w-100" src="/images/{{ $slide->photo }}" alt="Friend Slide {{ $index + 1 }}">
                <div class="carousel-caption">
                    <!-- Slide caption from the database -->
                </div>
            </a>
        </div>
        @endforeach
    </div>

    <!-- Controls -->
    <a class="carousel-control-prev" href="#friendCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#friendCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

<!-- carousel 2  -->
<div class="word text-center">
    <div class="">
        <h3>Men</h3>
    </div>
    <a href="" class="mr-2"></a>

    <div class="">
        <h3>Woman</h3>
    </div>
</div>

<div class="buttons-container">
    <div class="choosen">
        <button id="menButton" class="btn btn-primary"> </button>
        <a href="" class="mr-4"></a>
        <button id="womenButton" class="btn btn-primary"> </button>
    </div>
</div>


<div id="productArea">
    <!-- Men Product Cards -->
    <div id="menProducts">
        <!-- Add Men Product Cards Here -->
        <div class="product-list container">
            <div class="row">
                @foreach($products as $product)
                @if($product->category->name === 'Men')
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product-item fix mb-30">
                        <div class="product-thumb">
                            <p>
                                <img src="{{ asset('/images/' . $product->productImages[0]->photo) }}"
                                    class="img-{{ $product->id }}" alt="" width="100%" height="240px">
                            </p>
                            @if($product->featured != null)
                            <div class="product-label">
                                <span>{{ $product->featured }}</span>
                            </div>
                            @endif
                            <div class="product-action-link">
                                <a href="{{ url('shop/product/'.$product->id.'-'.$product->slug) }}">
                                    <span data-toggle="tooltip" data-placement="left" title="Quick view"><i
                                            class="fa fa-search mt-8"></i>
                                    </span>
                                </a>
                            </div>
                            <div class="add-cart">
                                <a href="#" data-pid="{{ $product->id }}">
                                    + Add to Cart
                                    <div style="display:none;">
                                        <input type="text" name="default-size"
                                            value="{{ $product->productDetails[0]->size }}" class="size-input">
                                    </div>
                                </a>

                            </div>

                        </div>
                        <div class="product-content">
                            <h4>{{ $product->name }}</h4>

                            <div class="pricebox">
                                @if($product->discount != null)
                                <span class="regular-price"> ${{ $product->discount }}</span>
                                <span class="old-price"><del> ${{ $product->price }}</del></span>
                                @else
                                <span class="regular-price"> ${{ $product->price }}</span>
                                @endif

                            </div>
                        </div>
                    </div>
                </div>
                @endif
                @endforeach
            </div>
        </div>
    </div>

    <!-- Women Product Cards -->
    <div id="womenProducts" class="product-cards">
        <!-- Add Women Product Cards Here -->
        <div class="product-list container">
            <div class="row">
                @foreach($products as $product)
                @if($product->category->name === 'Women')
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product-item fix mb-30">
                        <div class="product-thumb">
                            <p>
                                <img src="{{ asset('/images/' . $product->productImages[0]->photo) }}"
                                    class="img-{{ $product->id }}" alt="" width="100%" height="240px">
                            </p>
                            @if($product->featured != null)
                            <div class="product-label">
                                <span>{{ $product->featured }}</span>
                            </div>
                            @endif
                            <div class="product-action-link">
                                <a href="{{ url('shop/product/'.$product->id.'-'.$product->slug) }}">
                                    <span data-toggle="tooltip" data-placement="left" title="Quick view"><i
                                            class="fa fa-search mt-8"></i>
                                    </span>
                                </a>
                            </div>
                            <div class="add-cart">
                                <a href="#" data-pid="{{ $product->id }}">
                                    + Add to Cart
                                    <div style="display:none;">
                                        <input type="text" name="default-size"
                                            value="{{ $product->productDetails[0]->size }}" class="size-input">
                                    </div>
                                </a>

                            </div>

                        </div>
                        <div class="product-content">
                            <h4>{{ $product->name }}</h4>

                            <div class="pricebox">
                                @if($product->discount != null)
                                <span class="regular-price"> ${{ $product->discount }}</span>
                                <span class="old-price"><del> ${{ $product->price }}</del></span>
                                @else
                                <span class="regular-price"> ${{ $product->price }}</span>
                                @endif

                            </div>
                        </div>
                    </div>
                </div>
                @endif
                @endforeach
            </div>
        </div>
    </div>
    <!-- best seller  -->
    <div class="cover">
        <div class="word-container container">
            <div class="left-word">
                <h1>Best Seller</h1>
            </div>
            <div class="right-word"> <a href="{{url('/shop/Yeezy')}}">see all &gt;&gt;</a> </div>
        </div>

        <div class="best-seller-area text-center d-flex flex-wrap justify-content-center">
            @foreach ($products as $product)
            @if($product->featured === 'Best')
            <div class="best-seller-zone m-2">
                <img class="best-seller-image img-fluid"
                    src="{{ asset('/images/' . $product->productImages[0]->photo) }}" alt="Best Seller">
            </div>
            @endif
            @endforeach
        </div>
    </div>


    <!-- new release  -->

    <div class="new-release container-fluid">
        <h1 class="text-center">New Release</h1>
        <div class="product-list container">
            <div class="row">
                @foreach($products as $product)
                @if($product->featured === 'New')
                <div class="col-lg-3 col-md-4 col-sm-6">
                    <div class="product-item fix mb-30">
                        <div class="product-thumb">
                            <p>
                                <img src="{{ asset('/images/' . $product->productImages[0]->photo) }}"
                                    class="img-{{ $product->id }}" alt="" width="100%" height="240px">
                            </p>
                            @if($product->featured != null)
                            <div class="product-label">
                                <span>{{ $product->featured }}</span>
                            </div>
                            @endif
                            <div class="product-action-link">
                                <a href="{{ url('shop/product/'.$product->id.'-'.$product->slug) }}">
                                    <span data-toggle="tooltip" data-placement="left" title="Quick view"><i
                                            class="fa fa-search mt-8"></i>
                                    </span>
                                </a>
                            </div>
                            <div class="add-cart">
                                <a href="#" data-pid="{{ $product->id }}">
                                    + Add to Cart
                                    <div style="display:none;">
                                        <input type="text" name="default-size"
                                            value="{{ $product->productDetails[0]->size }}" class="size-input">
                                    </div>
                                </a>

                            </div>

                        </div>
                        <div class="product-content">
                            <h4>{{ $product->name }}</h4>

                            <div class="pricebox">
                                @if($product->discount != null)
                                <span class="regular-price"> ${{ $product->discount }}</span>
                                <span class="old-price"><del> ${{ $product->price }}</del></span>
                                @else
                                <span class="regular-price"> ${{ $product->price }}</span>
                                @endif

                            </div>
                        </div>
                    </div>
                </div>
                @endif
                @endforeach
            </div>
        </div>
    </div>
@endsection

@section("myjs")
    <script>
        $('.add-cart a').click(function (e) {
            e.preventDefault();

            let pid = $(this).data('pid');
            let quantity = 1;
            let size = $(this).closest('.add-cart').find('.size-input').val();

            let url = "{{ Route('addCart') }}";
            $.ajax({
                type: 'post',
                url: url,
                data: {
                    pid: pid,
                    quantity: quantity,
                    size: size,
                    _token: '{{ csrf_token() }}',
                }, success: function (data) {
                    location.reload();
                }
            });
        });
        // JavaScript to handle button click events and toggle product card visibility

        // Get the buttons and product card containers
        const menButton = document.getElementById('menButton');
        const womenButton = document.getElementById('womenButton');
        const menProducts = document.getElementById('menProducts');
        const womenProducts = document.getElementById('womenProducts');

        // Add click event listeners to the buttons
        menButton.addEventListener('click', function () {
            menProducts.style.display = 'flex';
            womenProducts.style.display = 'none';
        });

        // Show men products by default
        menProducts.style.display = 'flex';
        womenProducts.style.display = 'none';

        womenButton.addEventListener('click', function () {
            womenProducts.style.display = 'flex';
            menProducts.style.display = 'none';
        });
        const watchMoreButton = document.getElementById('watchMoreButton');
        const cleanButton = document.getElementById('cleanButton');
        const hiddenCards = document.querySelectorAll('.hidden');

        watchMoreButton.addEventListener('click', function () {
            hiddenCards.forEach(card => {
                card.classList.remove('hidden');
            });
            watchMoreButton.style.display = 'none';
            cleanButton.style.display = 'inline-block';
        });

        cleanButton.addEventListener('click', function () {
            hiddenCards.forEach(card => {
                card.classList.add('hidden');
            });
            watchMoreButton.style.display = 'inline-block';
            cleanButton.style.display = 'none';
        });

    </script>
@endsection