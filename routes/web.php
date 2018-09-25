<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('home');
});

Route::get('/plano', function () {
    return view('plano');
});

Route::get('/plano/{vue_capture?}', function () {
    return view('plano');
})->where('vue_capture', '[\/\w\.-]*');

Route::get('/indicadores', function () {
    return view('indicadores');
});

Route::get('/participe', function () {
    return view('participe');
});

Route::get('/contato', function () {
    return view('contato');
});

Route::post('/contato', 'ContactController@contact');
Route::post('/participe', 'SubscriptionController@store');


// API

Route::get('/api/acoes', 'ActionController@list');
Route::get('/api/eixos', 'AxisController@list');
Route::get('/api/indicadores', 'IndicatorController@list');
Route::get('/api/programas', 'ProgramController@list');
Route::get('/api/referencias', 'ReferenceController@list');
