<?php

namespace App\Http\Controllers;

use App\Models\Matiere;
use Illuminate\Http\Request;

class MatiereController extends Controller
{
    // Liste des matières
    public function index()
    {
        $matieres = Matiere::all();
        return response()->json($matieres);
    }

    // Ajouter une nouvelle matière
    public function store(Request $request)
    {
        $request->validate([
            'libelle' => 'required|string|max:255',
            'date_debut' => 'required|date',
            'date_fin' => 'required|date',
            'ue_id' => 'required|exists:ues,id'
        ]);

        $matiere = Matiere::create($request->all());
        return response()->json($matiere, 201);
    }

    // Afficher une matière spécifique
    public function show($id)
    {
        $matiere = Matiere::find($id);

        if (!$matiere) {
            return response()->json(['message' => 'Matière non trouvée'], 404);
        }

        return response()->json($matiere);
    }

    // Mettre à jour une matière
    public function update(Request $request, $id)
    {
        $request->validate([
            'libelle' => 'sometimes|required|string|max:255',
            'date_debut' => 'sometimes|required|date',
            'date_fin' => 'sometimes|required|date',
            'ue_id' => 'sometimes|required|exists:ues,id'
        ]);

        $matiere = Matiere::find($id);

        if (!$matiere) {
            return response()->json(['message' => 'Matière non trouvée'], 404);
        }

        $matiere->update($request->all());
        return response()->json($matiere);
    }

    // Supprimer une matière
    public function destroy($id)
    {
        $matiere = Matiere::find($id);

        if (!$matiere) {
            return response()->json(['message' => 'Matière non trouvée'], 404);
        }

        $matiere->delete();
        return response()->json(['message' => 'Matière supprimée avec succès']);
    }
}
