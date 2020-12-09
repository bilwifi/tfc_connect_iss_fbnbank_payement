<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payement extends Model
{
    //
    const CREATED_AT = 'd';
    protected $fillable = [
        'id_etudiant','montant','motif','devise','comment',
    ];
}
