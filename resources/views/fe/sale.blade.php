<style>
@import url("https://fonts.googleapis.com/css?family=Raleway");

:root {
  --glow-color: red;
  --glow-border: black;

}

*,
*::before,
*::after {
  box-sizing: border-box;
}

.glowing-btn {
  position: relative;
  color: var(--glow-color);
  cursor: pointer;
  padding: 0.35em 1em;
  border: 0.15em solid var(--glow-border);
  border-radius: 0.45em;
  background: none;
  perspective: 2em;
  font-family:cursive;
  font-size: 2em;
  font-weight: 900;
  letter-spacing: 1em;

  -webkit-box-shadow: inset 0px 0px 0.5em 0px var(--glow-border),
    0px 0px 0.5em 0px var(--glow-border);
  -moz-box-shadow: inset 0px 0px 0.5em 0px var(--glow-border),
    0px 0px 0.5em 0px var(--glow-border);
  box-shadow: inset 0px 0px 0.5em 0px var(--glow-border),
    0px 0px 0.5em 0px var(--glow-border);
  animation: border-flicker 2s linear infinite;
}

.glowing-txt {
  float: left;
  margin-right: -0.8em;
  -webkit-text-shadow: 0 0 0.125em hsl(0 0% 100% / 0.3),
    0 0 0.45em var(--glow-color);
  -moz-text-shadow: 0 0 0.125em hsl(0 0% 100% / 0.3),
    0 0 0.45em var(--glow-color);
  text-shadow: 0 0 0.125em hsl(0 0% 100% / 0.3), 0 0 0.45em var(--glow-color);
  animation: text-flicker 3s linear infinite;
}

.faulty-letter {
  opacity: 0.5;
  animation: faulty-flicker 2s linear infinite;
}

.glowing-btn::before {
  content: "";
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  opacity: 0.7;
  filter: blur(1em);
  transform: translateY(120%) rotateX(95deg) scale(1, 0.35);
  background: var(--glow-border);
  pointer-events: none;
}

.glowing-btn::after {
  content: "";
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  opacity: 0;
  z-index: -1;
  background-color: var(--glow-color);
  box-shadow: 0 0 2em 0.2em var(--glow-color);
  transition: opacity 100ms linear;
  border-radius: 0.45em;
}

.glowing-btn:hover {
  color: rgba(0, 0, 0, 0.8);
  text-shadow: none;
  animation: none;
  
}

.glowing-btn:hover .glowing-txt {
  animation: none;
}

.glowing-btn:hover .faulty-letter {
  animation: none;
  text-shadow: none;
  opacity: 1;
}

.glowing-btn:hover:before {
  filter: blur(1.5em);
  opacity: 1;
}

.glowing-btn:hover:after {
  opacity: 1;
}

@keyframes faulty-flicker {
  0% {
    opacity: 0.1;
  }
  2% {
    opacity: 0.1;
  }
  4% {
    opacity: 0.5;
  }
  19% {
    opacity: 0.5;
  }
  21% {
    opacity: 0.1;
  }
  23% {
    opacity: 1;
  }
  80% {
    opacity: 0.5;
  }
  83% {
    opacity: 0.4;
  }

  87% {
    opacity: 1;
  }
}

@keyframes text-flicker {
  0% {
    opacity: 0.1;
  }

  2% {
    opacity: 1;
  }

  8% {
    opacity: 0.1;
  }

  9% {
    opacity: 1;
  }

  12% {
    opacity: 0.1;
  }
  20% {
    opacity: 1;
  }
  25% {
    opacity: 0.3;
  }
  30% {
    opacity: 1;
  }

  70% {
    opacity: 0.7;
  }
  72% {
    opacity: 0.2;
  }

  77% {
    opacity: 0.9;
  }
  100% {
    opacity: 0.9;
  }
}

@keyframes border-flicker {
  0% {
    opacity: 0.1;
  }
  2% {
    opacity: 1;
  }
  4% {
    opacity: 0.1;
  }

  8% {
    opacity: 1;
  }
  70% {
    opacity: 0.7;
  }
  100% {
    opacity: 1;
  }
}

@media only screen and (max-width: 600px) {
  .glowing-btn{
    font-size: 1em;
  }
}

</style>
@extends('fe.layout.layout')

@section('contents')
 <!-- breadcrumb area start -->
 <div class="breadcrumb-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-wrap">
                        <nav aria-label="breadcrumb">
                            <ul class="breadcrumb">
                                <li class="breadcrumb-item"><a href="{{ Route('homepage') }}">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Sales</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- breadcrumb area end -->
    <div class="d-flex justify-content-center">
  <button class="glowing-btn">
    <span class="glowing-txt">S<span class="faulty-letter">A</span>LES</span>
  </button>
</div>

<div class="product-list container mt-5" >
                            <div class="row">
                                @foreach($products as $product)
                                @if($product->featured === 'Sale')
                                <div class="col-lg-3 col-md-4 col-sm-6">
                                    <div class="product-item fix mb-30">
                                        <div class="product-thumb">
                                            <p>
                                                <img src="{{ asset('/images/' . $product->productImages[0]->photo) }}"
                                                    class="img-{{ $product->id }}" alt="" width="100%"
                                                    height="240px">
                                            </p>
                                            @if($product->featured != null)
                                            <div class="product-label">
                                                <span>{{ $product->featured }}</span>
                                            </div>
                                            @endif
                                            <div class="product-action-link">
                                                <a href="{{ url('shop/product/'.$product->id.'-'.$product->slug) }}">
                                                    <span data-toggle="tooltip" data-placement="left"
                                                        title="Quick view"><i class="fa fa-search mt-8" ></i>
                                                    </span>
                                                </a>
                                            </div>
                                            <div class="add-cart">
                                                <a href="#" data-pid="{{ $product->id }}">
                                                    + Add to Cart
                                                    <div style="display:none;">
                                                        <input type="text" name="default-size"
                                                            value="{{ $product->productDetails[0]->size }}"
                                                            class="size-input">
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
            },success: function (data) {
                location.reload();
            }
        });
    });</script>
                        @endsection