<?php

use Illuminate\Support\Facades\Route;

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

Route::group(['namespace'=>'Api','prefix'=>'Api','as'=>'Api.'],function(){
        Route::get('/','apiController@index')->name('index');
        Route::get('/store','apiController@create')->name('create');
        Route::get('/show','apiController@show')->name('show');
        Route::get('/update/{productcode}','apiController@update')->name('update');
        Route::get('/delete/{productcode}','apiController@delete')->name('delete');
        Route::get('/stockupdate/{productid}','apiController@stockupdate')->name('stockupdate');
        Route::get('/productsingle/{productcode}','apiController@productsingle')->name('productsingle');
    });
