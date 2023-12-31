@extends('layouts.admin')

@section('main-content')
@if (session('success'))
    <div class="alert alert-success border-left-success alert-dismissible fade show" role="alert">
        {{ session('success') }}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
@endif

<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>



    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
          <h1 class="h3 mb-4 text-gray-800">{{ __('Brand') }}</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="{{ Route('brand.create') }}">Create Brand</a></li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">Brand</h3>
        <div class="card-body p-0">
        <table class="table table-striped projects">
  <thead>
    <tr>
      <th style="width: 1%">STT</th>
      <th style="width: 50%">Brand Name</th>
      <th style="width: 15%" class="text-center">Status</th>
      <th style="width: 10%">Action</th>
    </tr>
  </thead>
  <tbody>
    @foreach($brand as $index => $item)
    <tr>
      <td>{{ $index + 1 }}</td>
      <td><a>{{ $item->name }}</a><br/></td>
      <td class="project-actions text-center">
        <span class="badge badge-success">Success</span>
      </td>
      <td class="project-actions text-center">
      <div class="btn-group" role="group">
        <a class="btn btn-info btn-sm mr-2" href="{{ Route('brand.edit', $item->id) }}">
          <i class="fas fa-pencil-alt"></i> Edit
        </a>
        <form action="{{ route('brand.destroy', $item->id) }}" method="POST">
    @csrf
    @method('DELETE')
    <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this brand?')">
        <i class="fas fa-trash"></i> Delete
    </button>
</form>
</div>
      </td>
    </tr>
    @endforeach
  </tbody>
</table>

        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->

  @endsection
