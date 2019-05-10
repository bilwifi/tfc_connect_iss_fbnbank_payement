<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Enrole extends Model
{
    protected $primaryKey = 'idenroles';
     /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'idetudiants','idusers',
    ];

    public static function getNbrEtudiantByAuditoire($idauditoire){
        return self::join('etudiants','etudiants.idetudiants','enroles.idetudiants')
                    ->join('auditoires','etudiants.idauditoires','auditoires.idauditoires')
                    ->where('auditoires.idauditoires',$idauditoire)->count();
    }

     /**
    * Join la table étudiant
    */

    public static function scopeJoinStudent($query){

        return $query->join('etudiants','etudiants.idetudiants','enroles.idetudiants');

    }
    /**
    * Join la table étudiant
    */

    public static function scopeJoinStudentbyAuditoire($query,$idauditoires){

        return $query->JoinStudent()->where('idauditoires',$idauditoires);

    }
    
}
