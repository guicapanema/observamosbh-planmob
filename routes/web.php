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


// API
Route::get('/acoes', 'ActionController@list');
Route::get('/eixos', 'AxisController@list');
Route::get('/indicadores', 'IndicatorController@list');
Route::get('/programas', 'ProgramController@list');
