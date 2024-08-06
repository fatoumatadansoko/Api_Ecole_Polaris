<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UeController;
use App\Http\Controllers\MatiereController;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\EtudiantController;
use App\Http\Controllers\EvaluationController;

// Routes d'authentification
Route::post('login', [AuthController::class, 'login']);
Route::post('logout', [AuthController::class, 'logout'])->middleware('auth:api');
Route::post('refresh', [AuthController::class, 'refresh'])->middleware('auth:api');

// Route pour obtenir les informations de l'utilisateur authentifié
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

// Routes pour les Ue nécessitant une authentification
Route::middleware('auth:api')->prefix('ues')->group(function () {
    Route::get('/', [UeController::class, 'index']);
    Route::post('/', [UeController::class, 'store']);
    Route::get('/{id}', [UeController::class, 'show']);
    Route::put('/{id}', [UeController::class, 'update']);
    Route::delete('/{id}', [UeController::class, 'destroy']);
});

// Routes pour les Matières nécessitant une authentification
Route::middleware('auth:api')->prefix('matieres')->group(function () {
    Route::get('/', [MatiereController::class, 'index']);
    Route::post('/', [MatiereController::class, 'store']);
    Route::get('/{id}', [MatiereController::class, 'show']);
    Route::put('/{id}', [MatiereController::class, 'update']);
    Route::delete('/{id}', [MatiereController::class, 'destroy']);
});


// Route pour les etudiant necessitant une authentifications
Route::middleware('auth:api')->prefix('etudiants')->group(function () {
    Route::get('/', [App\Http\Controllers\EtudiantController::class, 'index']);
    Route::post('/', [App\Http\Controllers\EtudiantController::class, 'store']);
    Route::get('/{id}', [App\Http\Controllers\EtudiantController::class, 'show']);
    Route::put('/{id}', [App\Http\Controllers\EtudiantController::class, 'update']);
    Route::delete('/{id}', [App\Http\Controllers\EtudiantController::class, 'destroy']);
    Route::post('/{id}/restore', [EtudiantController::class, 'restore']);

});

Route::middleware('auth:api')->prefix('evaluations')->group(function () {
    Route::get('/', [EvaluationController::class, 'index']);         // Liste des évaluations
    Route::post('/', [EvaluationController::class, 'store']);        // Ajouter une évaluation
    Route::get('/{id}', [EvaluationController::class, 'show']);      // Afficher une évaluation spécifique
    Route::put('/{id}', [EvaluationController::class, 'update']);    // Mettre à jour une évaluation
    Route::delete('/{id}', [EvaluationController::class, 'destroy']); // Supprimer une évaluation
});

