<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Auditoire extends Model
{
    protected $primaryKey = 'idauditoires';
	
    public static function getAuditoireGroupBySection(){

        return self::join('sections','sections.idsections','=','auditoires.idsections')->get(['idauditoires','auditoires.lib','auditoires.abbr','sections.idsections','sections.lib as section_lib'])->groupBy('idsections');

    }

    public static function getBilan(){
    	$bilan = [];
    	$auditoires = self::get();
    	 foreach($auditoires as $auditoire){
    	 	// dump($auditoire->idauditoires);
    	 	$bilan[] = 
	 				[
	 					'auditoire' => $auditoire->lib,
                        'nbrEtudiant' => Etudiant::getNbrEtudiantByAuditoire($auditoire->idauditoires),
	 					'nbrEtudiantActif' => Etudiant::getNbrEtudiantActifByAuditoire($auditoire->idauditoires),
	 					'nbrEtudiantEnroles' => Enrole::getNbrEtudiantByAuditoire($auditoire->idauditoires),
	 					'nbrEtudiantOrdinaire' => Etudiant::getNbrEtudiantByProfilByAuditoire($auditoire->idauditoires,'ordinaire'),
	 					'nbrEtudiantAyantDroit' => Etudiant::getNbrEtudiantByProfilByAuditoire($auditoire->idauditoires,'ayant droit'),
	 				];
    	 }
    	return collect($bilan);

    }

}
