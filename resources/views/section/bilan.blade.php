@extends('layouts.master')
@include('partials.includes.dataTables.dataTables')
@include('partials.includes.dataTables.buttons')
@section('content')
<div class="container">
	<div class="card bg-light mb-3">
	  <div class="card-body">
		{!!$dataTable->table() !!}
	  </div>
	</div>
</div>	
@stop
@push('scripts')
{!!$dataTable->scripts() !!}
@endpush