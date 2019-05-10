@extends('layouts.master')
@include('partials.includes.dataTables.dataTables')
@include('partials.includes.dataTables.buttons')
@section('content')
<div class="container">
  <h3>{{ $auditoire->lib }}</h3>
	<button type="button" class="addModal btn btn-info" data-toggle="modal" data-target="#addModal">
  		<span class="fas fa-user-plus"> </span> Nouveau étudiant
	</button><br><br>
	<div class="card bg-light mb-3">
	  <div class="card-body">
		{!!$dataTable->table() !!}
	  </div>
	</div>


	<!-- Modal Edition-->
	<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
	<div class="modal-content">
	  <div class="modal-header">
	    <h5 class="modal-title" id="exampleModalCenterTitle">Modifier</h5>
	    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	      <span aria-hidden="true">&times;</span>
	    </button>
	  </div>
	  <div class="modal-body">
	    {{-- msg d'erreur --}}
	    {{-- Formulaire Edition--}}
	    <form id="etudiantForm" action="{{ route('comptabilite.updateEtudiant') }}" method="POST" name="etudiantForm" class="form-horizontal">
	        @csrf
	       <input type="hidden" name="data_idetudiants" id="data_idetudiants" value="">
	       <div class="form-group">
	              <label for="data_frais"  class="control-label">Frais total</label>
	              <div class="col-sm-12">
	                  <input type="digits"  class="form-control" id="data_frais" name="data_frais"  maxlength="50" >
	              </div>
	        </div>
	        <div class="form-group">
	            <label for="data_profil"  class="control-label">Profil de l'étudiant</label>
	            <div class="col-sm-12">
	            	@inject('Profils','App\Models\Profil')
	               	<select class="form-control" id="data_profil" name="data_profil"   required="required">
	            	@foreach($Profils->get() as $profil)
	               		<option value="{{ $profil->idprofils }}">{{ $profil->lib }}</option>
	               	@endforeach
	               	</select>
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="data_Commentaire" class=" control-label col-form-label">Commentaire</label>
	            <div class="col-12">
	                <textarea class="form-control" name="data_Commentaire" id="data_Commentaire" >
	                	
	                </textarea> 
	            </div>
	        </div>

	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
	        <button type="submit" class="save btn btn-primary">Enregistrer</button>
	      </div>
	    </form>

	  </div>
	</div>
	</div>
	</div>
<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle">Ajouter</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        {{-- msg d'erreur --}}
        {{-- Formulaire Creation --}}
        <form id="etudiantFormCreate" action="{{ route('comptabilite.createEtudiant') }}" method="POST" name="etudiantFormCreate" class="form-horizontal_create">
            @csrf
	       <input type="hidden" name="idauditoires" id="idauditoires" value="{{ $auditoire->idauditoires }}">

            <div class="form-group">
                  <label for="matricule"  class="control-label">Matricule</label>
                  <div class="col-sm-12">
                      <input type="text"  class="form-control" id="matricule" name="matricule"  maxlength="50" required="">
                  </div>
              </div>
              <div class="form-group">
                  <label for="nom"  class="control-label">Nom</label>
                  <div class="col-sm-12">
                      <input type="text"  class="form-control" id="nom" name="nom"  maxlength="50" required="">
                  </div>
              </div>
              <div class="form-group">
                  <label for="postnom"  class="control-label">Postnom</label>
                  <div class="col-sm-12">
                      <input type="text"  class="form-control" id="postnom" name="postnom"  maxlength="50" >
                  </div>
              </div>
              <div class="form-group">
                  <label for="prenom"  class="control-label">Prenom</label>
                  <div class="col-sm-12">
                      <input type="text"  class="form-control" id="prenom" name="prenom"  maxlength="50" >
                  </div>
              </div>
            <div class="form-group">
	              <label for="frais"  class="control-label">Frais total</label>
	              <div class="col-sm-12">
	                  <input type="digits"  class="form-control" id="frais" name="frais"  maxlength="50" >
	              </div>
	        </div>
	        <div class="form-group">
	            <label for="profil"  class="control-label">Profil de l'étudiant</label>
	            <div class="col-sm-12">
	            	@inject('Profils','App\Models\Profil')
	               	<select class="form-control" id="profil" name="profil"   required="required">
	            	@foreach($Profils->get() as $profil)
	               		<option value="{{ $profil->idprofils }}">{{ $profil->lib }}</option>
	               	@endforeach
	               	</select>
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="Commentaire" class=" control-label col-form-label">Commentaire</label>
	            <div class="col-12">
	                <textarea class="form-control" name="Commentaire" id="Commentaire" maxlength="65" >
	                	
	                </textarea> 
	            </div>
	        </div>


        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
          <button type="submit" class="save btn btn-primary">Enregistrer</button>
        </div>
        </form>
        
      </div>
    </div>
  </div>
</div>
</div>	
@stop
@push('scripts')
{!!$dataTable->scripts() !!}

<script type="text/javascript">
  
  {{-- Ajout étudiant formulaire --}}
  $(document).on('click', '.addModal', function() {
      $('#msgErrors').html('');
      $('#msgErrors').attr('hidden','true');

    $('.modal-title').text('Ajouter');
    // resetmodalData()
    $('.form-horizontal_create').trigger("reset");
    $('.form-horizontal_create').show();
    $('#myModal').modal('show');
    });

  {{-- edition du formulaire --}}
  $(document).on('click', '.edit-modal', function() {
        $('#msgErrors').html('');
          $('#msgErrors').attr('hidden','true');

      $('#footer_action_button').text(" Update");
      $('#footer_action_button').addClass('fa fa-check');
      $('#footer_action_button').removeClass('fa fa-trash');
      $('.actionBtn').addClass('btn-success');
      $('.actionBtn').removeClass('btn-danger');
      $('.actionBtn').removeClass('delete');
      $('.actionBtn').addClass('edit');
      $('.modal-title').text('Modifier');
      $('.deleteContent').hide();
      $('.form-horizontal').show();
      var stuff = $(this).data('info').split(',');
      fillmodalData(stuff)
      $('#myModal').modal('show');
      });

  // remplissage formulaire par les donnée d'une ligne selectionée
  function fillmodalData(details){
      $('#data_idetudiants').val(details[0]);
      // $('#matricule').val(details[1);
      // $('#nom').val(details[2]);
      // $('#postnom').val(details[3]);
      // $('#prenom').val(details[4]);
      $('#data_frais').val(details[5]);
      $('#data_profil').val(details[6]);
      $('#data_Commentaire').val(details[7]);
      }

  function resetmodalData(){
  	  $('#data_idetudiants').val('');
      // $('#matricule').val('');
      // $('#nom').val('');
      // $('#postnom').val('');
      // $('#prenom').val('');
      $('#data_frais').val('');
      $('#data_profil').val('');
      $('#data_Commentaire').val('');
     
      }



  {{-- Suppression  --}}
  $(document).on('click', '.delete-modal', function() {
    $('#footer_action_button').text(" Delete");
    $('#footer_action_button').removeClass('glyphicon-check');
    $('#footer_action_button').addClass('glyphicon-trash');
    $('.actionBtn').removeClass('btn-success');
    $('.actionBtn').addClass('btn-danger');
    $('.actionBtn').removeClass('edit');
    $('.actionBtn').addClass('delete');
    $('.modal-title').text('Delete');
    $('.deleteContent').show();
    $('.form-horizontal').hide();
    var stuff = $(this).data('info').split(',');
    $('.divd').text(stuff[0]);
    $('.dname').html(stuff[1] +" "+stuff[2]);
    $('#myModal').modal('show');
  });

</script>
@endpush