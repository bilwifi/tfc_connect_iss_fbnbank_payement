<?php

namespace App\Http\Controllers\Comptabilite;

use Illuminate\Http\Request;
use App\Http\Requests\UpdateEtudiantComptabiliteRequest;
use App\Http\Requests\CreateEtudiantComptabiliteRequest;
use App\Http\Controllers\Controller;
use App\DataTables\Comptabilite\ListeAuditoiresDataTable;
use App\DataTables\Comptabilite\ListeEtudiantByAuditoireDataTable;
use App\Models\Auditoire;
use App\Models\Etudiant;
use Flashy;

class DashboardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');  
    }
    /*
    * Affiche la liste des auditoires
    * @param $dataTables un dataTable 
    * @return la vue acceuil
    */
    public function index(ListeAuditoiresDataTable $dataTables){
    	return $dataTables->render('comptabilite.acceuil');
    }
    /*
    * Affiche la liste des etudiant
    * @param $dataTables un dataTable 
    * @return la vue listeEtudiants
    */
    public function getListStudent(Auditoire $auditoire, ListeEtudiantByAuditoireDataTable $dataTables){
    	return $dataTables->with(['idauditoires'=>$auditoire->idauditoires])->render('comptabilite.listeEtudiants',compact('auditoire'));
    }
    /*
    * Autorise ou demet un étudiant
    * étudiant demet ne s'affiche pas à la section
    * @param $dataTables un dataTable 
    * @return la vue listeEtudiants
    */
    public function autoriseStudent(Etudiant $etudiant){
    	$etudiant->statut = $etudiant->statut == 0 ? 1 : 0;	
    	$etudiant->save();
    	// Flashy
       $etudiant->statut == 1 ?
        Flashy::info("L'étudiant est autorisé en s'enrôler avec succès")
        : Flashy::info("L'étudiant n'est plus autorisé en s'enrôler");


    	return redirect()->back();
    }
    /*
    * Ajout étudiant
    * @return redirection back
    */
    public function createEtudiant(CreateEtudiantComptabiliteRequest $request){
    	Etudiant::updateOrCreate([
                                    'idetudiants' => $request->data_idetudiants
                                ],
                                [
                                    'matricule' => $request->matricule,
                                    'nom' => $request->nom,
                                    'postnom' => $request->postnom,
                                    'prenom' => $request->prenom,
                                    'idauditoires' => $request->idauditoires,
                                    'frais' => $request->frais,
                                    'idprofils' => $request->profil,
                                    'commentaire' => $request->Commentaire,
                                ]); 
        
  
        Flashy::success('Etudiant ajouté avec succès');
        return redirect()->back();
    }
    /*
    * Edition étudiant
    * @return redirection back
    */
    public function updateEtudiant(UpdateEtudiantComptabiliteRequest $request){
    	Etudiant::find($request->data_idetudiants)->update([
                                    'frais' => $request->data_frais,
                                    'idprofils' => $request->data_profil,
                                    'commentaire' => $request->data_Commentaire,
                                ]);
        

        Flashy::success('Informattion modifiée avec succès');
        return redirect()->back();
    }
}
