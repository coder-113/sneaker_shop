@extends('layouts.admin')

<style>
.gold-star {
    color: gold;
   text-align: center;
}

</style>

@section('main-content')


@if (session('success'))
    <div class="alert alert-success border-left-success alert-dismissible fade show" role="alert">
        {{ session('success') }}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
@endif





    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
          <h1 class="h3 mb-4 text-gray-800">{{ __('Comment') }}</h1>
          </div>

        </div>

      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Comment</h3>
        <div class="card-body p-0">
          <table class="table table-striped projects">
              <thead>
                  <tr>
                      <th style="width: 1%">
                          STT
                      </th>
                      <th style="width:15%">
                      UserName
                      </th>
                      <th style="width:10%">
                      Email
                      </th>
                      <th style="width:15%">
                      Product
                      </th>
                      <th style="width:20%">
                      Content
                      </th>
                      <th style="width: 15%" >
                        Rating
                      </th>
                      <th style="width: 10%">
                      Action
                      </th>
                  </tr>
              </thead>
              <tbody>
              @foreach($com as $index => $image)
    <tr>
        <td>{{ $index + 1 }}</td>
        <td>{{ $image->name }}</td>
        <td>{{ $image->email }}</td>
        <td>{{ $image->product->name }}</td>
        <td>{{ $image->messages }}</td>
        <td>
            @for($i = 1; $i <= $image->rating; $i++)
                <i class="fa fa-star gold-star"></i>
            @endfor
        </td>



        <td class="project-actions text-center">

    <form action="{{ route('comment.destroy', $image->id) }}" method="POST">
    @csrf
    @method('DELETE')
    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this Comment?')">
        <i class="fas fa-trash"></i> Delete
    </button>
</form>
</td>
    </tr>
    @endforeach

    {{ $com->links() }}

</tbody>



          </table>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->

  @endsection
