<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ue extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function matieres()
    {
        return $this->hasMany(Matiere::class);
    }
}
