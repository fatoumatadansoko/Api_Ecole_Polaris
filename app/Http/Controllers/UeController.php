<?php

namespace App\Http\Controllers;

use App\Models\Ue;
use Illuminate\Http\Request;

class UeController extends Controller
{
    // Afficher la liste des UE
    public function index()
    {
        $ues = Ue::all();
        return response()->json($ues);
    }

    // Afficher le formulaire de création d'une nouvelle UE
    public function create()
    {
        // Retourne une vue de formulaire si vous utilisez les vues Blade
        return view('ues.create');
    }

    // Enregistrer une nouvelle UE
    public function store(Request $request)
    {
        $request->validate([
            'date_debut' => 'required|date',
            'date_fin' => 'required|date',
            'coef' => 'required|integer',
            'libelle' => 'required|string|max:255',
        ]);

        $ue = Ue::create($request->all());

        return response()->json($ue, 201);
    }

    // Afficher les détails d'une UE spécifique
    public function show($id)
    {
        $ue = Ue::findOrFail($id);
        return response()->json($ue);
    }

    // Afficher le formulaire d'édition d'une UE
    public function edit($id)
    {
        $ue = Ue::findOrFail($id);
        // Retourne une vue de formulaire si vous utilisez les vues Blade
        return view('ues.edit', compact('ue'));
    }

    // Mettre à jour une UE existante
    public function update(Request $request, $id)
    {
        $request->validate([
            'date_debut' => 'required|date',
            'date_fin' => 'required|date',
            'coef' => 'required|integer',
            'libelle' => 'required|string|max:255',
        ]);

        $ue = Ue::findOrFail($id);
        $ue->update($request->all());

        return response()->json($ue);
    }

    // Supprimer une UE
    public function destroy($id)
    {
        $ue = Ue::findOrFail($id);
        $ue->delete();

        return response()->json(['message' => 'UE deleted successfully']);
    }
}

