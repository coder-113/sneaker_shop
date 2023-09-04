<!DOCTYPE html>
<html lang="en">

<head>
    @include('fe.layout.head')
</head>

<body>
    
    @include('fe.layout.header')

    @yield('contents')
    
    @include('fe.layout.footer')
</body>

</html>
