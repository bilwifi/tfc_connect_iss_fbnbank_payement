@inject('Auditoire', 'App\Models\Auditoire')
@extends('layouts.master')

@section('content')
<div class="container">
	<div class="row">
        <div class="col-md-12">
         <h2 class="badge badge-pill badge-info">FBN BANK | ISS KIN</h2>
        </div>
    </div>
	<div class="card bg-light mb-3">
        <div class="card-header">
            <div class="text-center"><h3>PAYEMENT</h3></div>
            <br>

            <table class="table  table-borderless">
                <tbody>
                <tr>
                    <th scope="row">Nom </th>
                    <td>{{$etudiant->nom}} </td>
                    <th scope="row">Postnom </th>
                    <td>{{$etudiant->postnom}} </td>
                </tr>

                <tr>
                    <th scope="row">Prenom </th>
                    <td>{{$etudiant->prenom}} </td>
                    <th scope="row">Promotion </th>
                    <td>{{$Auditoire::find($etudiant->idauditoires)->abbr}} </td>
                </tr>

                </tbody>
            </table>
        </div>
	  <div class="card-body">



        <form class="needs-validation" novalidate method="POST">
            @csrf
            {{-- <div class="form-row">
              <div class="col-md-4 mb-3">
                <label for="validationCustom01">First name</label>
                <input type="text" class="form-control" id="validationCustom01" placeholder="First name" value="Mark" required>
                <div class="valid-feedback">
                  Looks good!
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <label for="validationCustom02">Last name</label>
                <input type="text" class="form-control" id="validationCustom02" placeholder="Last name" value="Otto" required>
                <div class="valid-feedback">
                  Looks good!
                </div>
              </div>
              <div class="col-md-4 mb-3">
                <label for="validationCustomUsername">Username</label>
                <div class="input-group">
                  <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroupPrepend">@</span>
                  </div>
                  <input type="text" class="form-control" id="validationCustomUsername" placeholder="Username" aria-describedby="inputGroupPrepend" required>
                  <div class="invalid-feedback">
                    Please choose a username.
                  </div>
                </div>
              </div>
            </div> --}}
            <div class="form-row">

              <div class="col-md-3 mb-3">
                <label for="validationCustom04">Motif</label>
                {{-- <input type="text" class="form-control" id="validationCustom04" placeholder="State" required> --}}
                <select class="form-control" name="motif">
                    <option value="Inscription">Inscription</option>
                    <option value="Frais Academique">Frais Academique</option>
                    <option value="USD">Frais Connexe</option>
                    <option value="Frais Connexe">Frais Connexe</option>
                  </select>
                <div class="invalid-feedback">
                  Veillez choisir le motif
                </div>
              </div>
              <div class="col-md-3 mb-3">
                <label for="validationCustom05">Devise</label>
                {{-- <input type="text" class="form-control" id="validationCustom05" placeholder="Zip" required> --}}
                <select class="form-control" name="devise" required>
                    <option value="FC">FC</option>
                    <option value="USD">USD</option>
                  </select>
                <div class="invalid-feedback">
                  Veillez choisir la devise
                </div>
              </div>
              <div class="col-md-6 mb-3">
                <label for="validationCustom03">Montant</label>
                <input type="number" class="form-control" id="validationCustom03" placeholder="Montant" name="montant" required>
                <div class="invalid-feedback">
                  Veillez entrer un montant valide
                </div>
              </div>
            </div>
            {{-- <div class="form-group">
              <div class="form-check">
                <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required>
                <label class="form-check-label" for="invalidCheck">
                  Agree to terms and conditions
                </label>
                <div class="invalid-feedback">
                  You must agree before submitting.
                </div>
              </div>
            </div> --}}
            <div class="form-group">
                <label for="exampleFormControlTextarea1">Commentaire</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="commentaire"></textarea>
              </div>
            <button class="btn btn-primary" type="submit">Valider</button>
          </form>

          <script>
          // Example starter JavaScript for disabling form submissions if there are invalid fields
          (function() {
            'use strict';
            window.addEventListener('load', function() {
              // Fetch all the forms we want to apply custom Bootstrap validation styles to
              var forms = document.getElementsByClassName('needs-validation');
              // Loop over them and prevent submission
              var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                  if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                  }
                  form.classList.add('was-validated');
                }, false);
              });
            }, false);
          })();
          </script>
	  </div>
	</div>
</div>
@stop

