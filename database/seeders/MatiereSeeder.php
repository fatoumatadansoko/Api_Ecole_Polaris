<?php

namespace Database\Seeders;

use App\Models\Matiere;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class MatiereSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // on va créer 20 matireres, en s'assurant que chaque matiere a un unité d'enseinement
        Matiere::factory()->count(20)->create();
    }
}
