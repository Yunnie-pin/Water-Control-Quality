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
    'controller' => ClientController::class
], function () {
    Route::get('/client', 'all');
    Route::post('/client', 'add');
    Route::get('/client/{id}', 'get');
    Route::put('/client/{id}', 'put');
    Route::delete('/client/{id}', 'delete');
});
