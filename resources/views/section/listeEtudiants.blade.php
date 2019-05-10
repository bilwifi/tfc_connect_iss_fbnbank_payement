@extends('layouts.master')
@include('partials.includes.dataTables.dataTables')
@include('partials.includes.dataTables.buttons')
@section('content')
<div class="container">
	<h3>{{ $auditoire->lib }}</h3>
	<a  href="{{ route('section.getListStudentEnroles',$auditoire->idauditoires) }}" type="button" class="btn btn-info">
  		<span class="fa fa-user"> </span> Etudiants enrôlés
	</a><br><br>
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