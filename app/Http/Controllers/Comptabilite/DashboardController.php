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
        
          //---------------------------------------------------------------
         //
        // AJOUT DE FLASHY
       //------------------------------------------------------------------- 
        // Flashy::success('Etudiant ajouter avec succès');
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
        
          //---------------------------------------------------------------
         //
        // AJOUT DE FLASHY
       //------------------------------------------------------------------- 
        // Flashy::success('Etudiant ajouter avec succès');
        return redirect()->back();
    }
}
