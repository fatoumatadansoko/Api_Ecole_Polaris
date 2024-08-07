<?php

namespace App\Http\Controllers\Annotations ;

/**
 * @OA\Security(
 *     security={
 *         "BearerAuth": {}
 *     }),

 * @OA\SecurityScheme(
 *     securityScheme="BearerAuth",
 *     type="http",
 *     scheme="bearer",
 *     bearerFormat="JWT"),

 * @OA\Info(
 *     title="Your API Title",
 *     description="Your API Description",
 *     version="1.0.0"),

 * @OA\Consumes({
 *     "multipart/form-data"
 * }),

 *

 * @OA\DELETE(
 *     path="/api/etudiants{id}",
 *     summary="delete",
 *     description="",
 *         security={
 *    {       "BearerAuth": {}}
 *         },
 * @OA\Response(response="204", description="Deleted successfully"),
 * @OA\Response(response="401", description="Unauthorized"),
 * @OA\Response(response="403", description="Forbidden"),
 * @OA\Response(response="404", description="Not Found"),
 *     @OA\Parameter(in="path", name="id", required=false, @OA\Schema(type="string")
 * ),
 *     @OA\Parameter(in="header", name="User-Agent", required=false, @OA\Schema(type="string")
 * ),
 *     tags={"Etudiant"},
*),


 * @OA\PUT(
 *     path="/api/etudiants{id}",
 *     summary="update",
 *     description="",
 *         security={
 *    {       "BearerAuth": {}}
 *         },
 * @OA\Response(response="200", description="OK"),
 * @OA\Response(response="404", description="Not Found"),
 * @OA\Response(response="500", description="Internal Server Error"),
 *     @OA\Parameter(in="path", name="id", required=false, @OA\Schema(type="string")
 * ),
 *     @OA\Parameter(in="header", name="User-Agent", required=false, @OA\Schema(type="string")
 * ),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\MediaType(
 *             mediaType="application/x-www-form-urlencoded",
 *             @OA\Schema(
 *                 type="object",
 *                 properties={
 *                     @OA\Property(property="nom", type="string"),
 *                     @OA\Property(property="prenom", type="string"),
 *                     @OA\Property(property="adresse", type="string"),
 *                     @OA\Property(property="matricule", type="string"),
 *                     @OA\Property(property="photo", type="string"),
 *                     @OA\Property(property="date_naissance", type="string"),
 *                     @OA\Property(property="email", type="string"),
 *                     @OA\Property(property="telephone", type="integer"),
 *                     @OA\Property(property="created_at", type="string"),
 *                     @OA\Property(property="updated_at", type="string"),
 *                     @OA\Property(property="deleted_at", type="string", format="binary"),
 *                 },
 *             ),
 *         ),
 *     ),
 *     tags={"Etudiant"},
*),


 * @OA\POST(
 *     path="/api/etudiants",
 *     summary="ajout",
 *     description="",
 *         security={
 *    {       "BearerAuth": {}}
 *         },
 * @OA\Response(response="201", description="Created successfully"),
 * @OA\Response(response="400", description="Bad Request"),
 * @OA\Response(response="401", description="Unauthorized"),
 * @OA\Response(response="403", description="Forbidden"),
 *     @OA\Parameter(in="header", name="User-Agent", required=false, @OA\Schema(type="string")
 * ),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\MediaType(
 *             mediaType="multipart/form-data",
 *             @OA\Schema(
 *                 type="object",
 *                 properties={
 *                     @OA\Property(property="id", type="integer"),
 *                     @OA\Property(property="nom", type="string"),
 *                     @OA\Property(property="prenom", type="string"),
 *                     @OA\Property(property="adresse", type="string"),
 *                     @OA\Property(property="matricule", type="string"),
 *                     @OA\Property(property="photo", type="string"),
 *                     @OA\Property(property="date_naissance", type="string"),
 *                     @OA\Property(property="email", type="string"),
 *                     @OA\Property(property="telephone", type="string"),
 *                     @OA\Property(property="created_at", type="string"),
 *                     @OA\Property(property="updated_at", type="string"),
 *                     @OA\Property(property="deleted_at", type="string", format="binary"),
 *                 },
 *             ),
 *         ),
 *     ),
 *     tags={"Etudiant"},
*),


 * @OA\GET(
 *     path="/api/etudiants",
 *     summary="affichage",
 *     description="",
 *         security={
 *    {       "BearerAuth": {}}
 *         },
 * @OA\Response(response="200", description="OK"),
 * @OA\Response(response="404", description="Not Found"),
 * @OA\Response(response="500", description="Internal Server Error"),
 *     @OA\Parameter(in="header", name="User-Agent", required=false, @OA\Schema(type="string")
 * ),
 *     tags={"Etudiant"},
*),


*/

 class EtudiantAnnotationController {}
