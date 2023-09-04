
@extends('layouts.admin')

@section('main-content')
<h1 class="h3 mb-4 text-gray-800">{{ __('Slider') }}</h1>
    <div class="container">
        <div class="row">
        <form action="{{ Route('slider.store') }}" method="post"  enctype="multipart/form-data">
                    @csrf
                    <div class="form-group">
                    <label>Photo:</label>
    <input type="file" name="photo" id="photo" onchange="previewImage(event)">
    <br>
    <img id="preview" src="#" alt="Preview" style="max-width: 200px; max-height: 200px; display: none;">
</div>

<script>
function previewImage(event) {
    var input = event.target;
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var preview = document.getElementById('preview');
            preview.src = e.target.result;
            preview.style.display = 'block';
        }
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="reset" class="btn btn-default">Reset</button>
                </form>

                </div>


    </div>

@endsection
