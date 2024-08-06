<?php

namespace Database\Seeders;

use App\Models\Ue;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;

class UeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //crée 10 unité d'enseignements
        Ue::factory()->count(10)->create();
    }
}
