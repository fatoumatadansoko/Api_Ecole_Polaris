<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UeController;
use App\Http\Controllers\MatiereController;
use App\Http\Controllers\Api\AuthController;

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
