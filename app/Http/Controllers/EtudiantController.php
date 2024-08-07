<?php

namespace App\Http\Controllers;

use App\Models\Etudiant;
use Illuminate\Http\Request;
use App\Http\Requests\UpdateEtudiantRequest;

class EtudiantController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // Liste des étudiants
        $etudiants = Etudiant::all();
        return response()->json($etudiants);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
{
    try {
        // $request->validate([
        //     'nom' => 'required|string|max:255',
        //     'prenom' => 'required|string|max:255',
        //     'adresse' => 'required|string|max:255',
        //     'matricule' => 'required|string|max:255|unique:etudiants,matricule',
        //     'photo' => 'required|string|max:255',
        //     'date_naissance' => 'required|date',
        //     'email' => 'required|email|unique:etudiants,email',
        //     'telephone' => 'required|string|max:15',
        // ]);

        $etudiant = Etudiant::create($request->all());
        return response()->json($etudiant, 201);

    } catch (\Exception $e) {
        return response()->json(['error' => $e->getMessage()], 500);
    }
}


    /**
     * Display the specified resource.
     */
    public function show($id)
    {
        // Afficher un étudiant spécifique
        $etudiant = Etudiant::find($id);

        if (!$etudiant) {
            return response()->json(['message' => 'Etudiant non trouvé'], 404);
        }

        return response()->json($etudiant);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateEtudiantRequest $request, Etudiant $etudiant)
    {
        // Mettre à jour un étudiant
        $request->validate([
            'nom' => 'sometimes|required|string|max:255',
            'prenom' => 'sometimes|required|string|max:255',
            'adresse' => 'sometimes|required|string|max:255',
            'matricule' => 'sometimes|required|string|max:255|unique:etudiants,matricule,' . $etudiant->id,
            'photo' => 'sometimes|required|string|max:255',
            'date_naissance' => 'sometimes|required|date',
            'email' => 'sometimes|required|email|unique:etudiants,email,' . $etudiant->id,
            'telephone' => 'sometimes|required|string|max:15',
        ]);
    
        // Mettre à jour l'étudiant avec les données validées
        $etudiant->update($request->all());
    
        // Retourner une réponse JSON
        return response()->json(['message' => 'Étudiant modifié', 'etudiant' => $etudiant]);
    }
    
    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $etudiant = Etudiant::find($id);
    
        if (!$etudiant) {
            return response()->json(['message' => 'Etudiant non trouvé'], 404);
        }
    
        $etudiant->delete();
    
        return response()->json(['message' => 'Etudiant supprimé avec succès']);
    }
    public function restore($id)
    {
        $etudiant = Etudiant::onlyTrashed()->find($id);
    
        if (!$etudiant) {
            return response()->json(['message' => 'Etudiant non trouvé'], 404);
        }
    
        $etudiant->restore();
    
        return response()->json(['message' => 'Etudiant restauré avec succès']);
    }
        
}
