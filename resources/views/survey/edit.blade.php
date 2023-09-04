@extends('layouts.app')

@section('content')
    <div class="container">
        <form action="{{ route('survey.update', $survey->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')

            <div class="form-group">
                <label for="photo">Photo</label>
                <input type="file" class="form-control-file" id="photo" name="photo">
            </div>

            <button type="submit" class="btn btn-primary">Update</button>
        </form>
    </div>
@endsection
