<?php

namespace App\Http\Controllers;

use App\Models\Evaluation;
use Illuminate\Http\Request;

class EvaluationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Liste des évaluations
        $evaluations = Evaluation::all();
        return response()->json($evaluations);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        // Ajouter une nouvelle évaluation
        $request->validate([
            'date' => 'required|date',
            'valeur' => 'required|integer',
            'etudiant_id' => 'required|exists:etudiants,id',
            'matiere_id' => 'required|exists:matieres,id',
            'ue_id' => 'required|exists:ues,id',
            'note' => 'required|numeric|min:0|max:20',
        ]);

        $evaluation = Evaluation::create($request->all());
        return response()->json($evaluation, 201);
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        // Afficher une évaluation spécifique
        $evaluation = Evaluation::find($id);

        if (!$evaluation) {
            return response()->json(['message' => 'Évaluation non trouvée'], 404);
        }

        return response()->json($evaluation);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        // Mettre à jour une évaluation
        $request->validate([
            'date' => 'sometimes|required|date',
            'valeur' => 'sometimes|required|integer',
            'etudiant_id' => 'sometimes|required|exists:etudiants,id',
            'matiere_id' => 'sometimes|required|exists:matieres,id',
            'ue_id' => 'sometimes|required|exists:ues,id',
            'note' => 'sometimes|required|numeric|min:0|max:20',
        ]);

        $evaluation = Evaluation::find($id);

        if (!$evaluation) {
            return response()->json(['message' => 'Évaluation non trouvée'], 404);
        }

        $evaluation->update($request->all());
        return response()->json($evaluation);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        // Supprimer une évaluation
        $evaluation = Evaluation::find($id);

        if (!$evaluation) {
            return response()->json(['message' => 'Évaluation non trouvée'], 404);
        }

        $evaluation->delete();
        return response()->json(['message' => 'Évaluation supprimée avec succès']);
    }
}
