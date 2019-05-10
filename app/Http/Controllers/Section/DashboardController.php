<?php

namespace App\Http\Controllers\Section;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\DataTables\Section\ListeAuditoiresDataTable;
use App\DataTables\Section\ListeEtudiantByAuditoireDataTable;
use App\DataTables\Section\ListeEtudiantsEnrolesDataTable;
use App\DataTables\Section\BilanDataTable;
use App\Models\Auditoire;
use App\Models\Etudiant;
use App\Models\Enrole;
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
    public function index(){
    	return redirect()->route('section.getBilan');
    }

    /*
    * Affiche la liste des auditoires
    * @param $dataTables un dataTable 
    * @return la vue acceuil
    */
    public function getListAuditoires(ListeAuditoiresDataTable $dataTables){
        $section = \App\Models\Section::find(auth()->user()->idsections)->lib;
        return $dataTables->render('section.acceuil',compact('section'));
    }
    /*
    * Affiche la liste des etudiant
    * @param $dataTables un dataTable 
    * @return la vue listeEtudiants
    */
    public function getListStudent(Auditoire $auditoire, ListeEtudiantByAuditoireDataTable $dataTables){
    	return $dataTables->with(['idauditoires'=>$auditoire->idauditoires])->render('section.listeEtudiants',compact('auditoire'));
    }
    /*
    * Enrôler un étudiant
    */
    public function enrolerEtudiant(Etudiant $etudiant){
        Enrole::create([
            'idetudiants' => $etudiant->idetudiants,
            'idusers' => 1,
        ]);  
        // Flashy
        Flashy::success("L'étudiant a été enrôler avec succès");
        return redirect()->back();
    }
    /*
    * Affiche la liste des etudiant enroller
    * @param $dataTables un dataTable 
    * @return la vue listeEtudiants
    */
    public function getListStudentEnroler(Auditoire $auditoire, ListeEtudiantsEnrolesDataTable $dataTables){
        return $dataTables->with(['idauditoires'=>$auditoire->idauditoires,'auditoire'=>$auditoire->lib])->render('section.listeEtudiantsEnroles',compact('auditoire'));
    }
    /*
    * Affiche le bilan de chaque auditoire
    * @param $dataTables un dataTable 
    * @return la vue listeEtudiants
    */
    public function getBilan(BilanDataTable $dataTables){
        return $dataTables->render('section.bilan');
    }

        /*
    * supprimer un etudiant enroller
    * @idetudiants
    */
    public function destroyEnrolement(Enrole $enrole){
        Enrole::where('idenroles',$enrole->idenroles)->delete();
        Flashy::info("L'étudiant est retiré aux enrôlés avec succès");
        return redirect()->back();
    }



    
}
