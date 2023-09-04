@extends('fe.layout.layout')

@section('contents')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<!-- breadcrumb area start -->
<div class="breadcrumb-area">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="breadcrumb-wrap">
                    <nav aria-label="breadcrumb">
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ Route('homepage') }}">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Contact Us</li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- breadcrumb area end -->

<div class="contact"><br>
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <h3>DEALZONE</h3><br>

                <div class="contact-icon">
                    <p class="ti-location-pin">
                    <ul></ul>
                    </p>
                    <br>
                    <p class="ti-email">
                    <ul> DealZone.com</ul>
                    </p>
                    <br>

                    <p class="ti-time">
                    <ul>MON-SAT: 11AM-6PM<br>SUN: 12-5PM</ul>
                    </p>
                </div>

                <br>


                <div class="social">
                    <a href="">
                        <p class="ti-instagram"></p>
                    </a>
                    <a href="">
                        <p class="ti-facebook"></p>
                    </a>
                    <a href="">
                        <p class="ti-twitter"></p>
                    </a>
                </div>
            </div>

            <div class="col-sm-6">
                <h3>MESSAGE US</h3><br>

                <form action="{{ route('contact.save') }}" method="POST" enctype="multipart/form-data">
                    @csrf

                    <div class="form-group">
                        <label for="">Title <span>*</span></label>
                        <input type="text" class="form-control" id="title" name="title" value="" required>
                    </div>

                    <div class="form-group">
                        <label for="">Content <span>*</span></label>
                        <textarea type="text" class="form-control" id="content" name="content" value=""
                            required> </textarea>
                    </div>

                    <button type="submit" class="contact-btn">Submit</button>

                </form>

            </div>
        </div>

        <div class="">
            <h3>OUR LOCATION</h3>
            <div class="map">
                <iframe
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1255.0604181064464!2d106.66627445885098!3d10.786734820966533!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752ed2392c44df%3A0xd2ecb62e0d050fe9!2zRlBUIEFwdGVjaCBIQ00gMSAtIEjhu4cgVGjhu5FuZyDEkMOgbyBU4bqhbyBM4bqtcCBUcsOsbmggVmnDqm4gUXXhu5FjIFThur8gKFNpbmNlIDE5OTkp!5e0!3m2!1svi!2s!4v1684832980382!5m2!1svi!2s"
                    width="" height="" style="border:0;" allowfullscreen="" loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </div>
    </div>
</div>
@endsection