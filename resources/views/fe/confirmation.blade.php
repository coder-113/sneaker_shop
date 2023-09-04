<!DOCTYPE html>
<html>
<head>
    <title>Survey Confirmation</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>body{background-color: #eee}.card{border:none;position: relative}.off{font-size: 60px;margin-top: -16px !important;color: blue}.flat{font-size: 20px}.star{margin-top: 25px !important;font-size: 28px}.line{padding-right: 8rem!important;padding-left: 8rem!important}.line hr{height: 2px}</style>
</head>
<body>
<div class="container"> 
    <h1 class="text-center">Thank you for submitting the survey!</h1>
    <div class="alert alert-danger" role="alert">
        <h1>   
  Before leave the site, please remember this code because you dont have a second time to see it!!!.  </h1>
</div>
 
<div class="container mt-5">
    <div class="row d-flex justify-content-center">
        <div class="col-md-5">
            <div class="card">
                <div class="text-right p-2"> <img src="{{ asset('/images/logo.png') }}" width="50"> </div>
                <div class="text-center mb-4"> <small class="text-uppercase flat">Congrate!! your code is</small> </div>
                <div class="d-flex justify-content-center px-2">
                    <div class="d-flex flex-row  ">
                        <h1 class="mt-0 off">{{$promotionCode}}</h1> <sup class="mt-2 text-primary star">*</sup>
                    </div>
                </div>
                <div class="line">
                    <hr>
                </div>
                <div class="text-center mb-5"> <span class="text-uppercase text-danger">!! Don't forget the code</span> </div>
                <div class="text-right p-1 text-muted"> <small>-This promotion belong to DealZone-</small> </div>
            </div>
        </div>
    </div>
   <a href="{{route('homepage')}}">  <h3 class="text-center text-danger mt-5">!!Click Here To Exit Promotion Site</h3></a>
</div>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>
