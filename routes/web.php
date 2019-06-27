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
    return view('welcome');
});

Route::get('/pegawai/login', 'Auth\PegawaiLoginController@showLoginForm')->name('pegawai.login');
Route::post('/pegawai/login', 'Auth\PegawaiLoginController@login')->name('pegawai.login.post');
Route::post('/pegawai/logout', 'Auth\PegawaiLoginController@logout')->name('pegawai.logout');

Route::group(['middleware' => 'pegawai'], function () {
    Route::get('/pegawai/home', 'Pegawai\HomeController@index')->name('pegawai.home');
});
