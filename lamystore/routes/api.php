<?php

use App\Http\Controllers\ApiController;
use App\Models\City;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('/ajax-search-product',[ApiController::class,'ajaxSearch'])->name('api-ajax-search-product');

Route::get('/provinces/{id}/cities', function($id) {
  $cities = City::where('province_id', $id)->get();
  return $cities;
});