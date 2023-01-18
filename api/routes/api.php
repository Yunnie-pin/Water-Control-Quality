<?php

use App\Http\Controllers\ClientController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group([
    'controller' => ClientController::class,
    'prefix' => 'client'
], function () {
    Route::get('/', 'find_all');
    Route::post('/', 'create');
    Route::get('/{id}', 'find_by_id');
    Route::put('/{id}', 'update');
    Route::delete('/{id}', 'delete');
});

Route::group([
    'controller' => ModuleController::class,
    'prefix' => 'module'
], function(){
    Route::get('/','find_all');
    Route::post('/','create');
    Route::get('/{id}','find_by_id');
    Route::put('/{id}','update');
    Route::delete('/{id}','delete');
});
