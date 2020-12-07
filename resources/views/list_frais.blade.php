@inject('Auditoire', 'App\Models\Auditoire')
@extends('layouts.master')
@section('content')
<div class="container"  >
	<div class="row">
        <div class="col-md-12">
        <h2 class="badge badge-pill badge-info">Payements de l'étudiant : {{$etudiant->nom ." ". $etudiant->postnom}}</h2>
        </div>
    </div>
     {{-- <hr /> --}}
	<div class="card bg-light mb-3">
	  <div class="card-body" >
          @if (!count($payements))
              <h3>L'étudiant {{$etudiant->nom ." ".$etudiant->prenom}} n'a rien payé pour l'instant !!!</h3>
          @endif
          @foreach ($payements as $payement)
            <div class="card">
            <h5 class="card-header">TRANSATION N° {{$payement->d->getTimeStamp()}}{{$payement->id}}</h5>
                <div class="card-body">
                <table class="table table-hover">
                    <tbody>
                    <tr>
                        <th scope="row">Nom </th>
                        <td>{{$payement->nom}} </td>
                        <th scope="row">Postnom </th>
                        <td>{{$payement->postnom}} </td>
                    </tr>

                    <tr>
                        <th scope="row">Prenom </th>
                        <td>{{$payement->prenom}} </td>
                        <th scope="row">Promotion </th>
                        <td>{{$Auditoire::find($payement->idauditoires)->abbr}} </td>
                    </tr>
                    <tr>
                        <th scope="row">Montant </th>
                        <td>({{$payement->devise}} ) {{$payement->montant}} </td>
                        <th scope="row"> Motif</th>
                        <td>{{$payement->motif}}</td>
                    </tr>

                    <tr>
                        <th scope="row"> Commentaire</th>
                        <td>{{!empty($payement->comment) ? $payement->comment : "----------"}}</td>
                        <th scope="row"> Date</th>
                        <td>{{$payement->d}}</td>
                    </tr>


                    </tbody>
                </table>
                </div>
            </div>

            <hr>
            <br>
          @endforeach
	  </div>
    </div>
</div>
@stop
@push('scripts')
@endpush
