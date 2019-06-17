<?php

use Illuminate\Http\Request;

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => ['jwt.verify']], function() {
	
    Route::get('user', 'UserController@getAuthenticatedUser');
    Route::put('user', 'UserController@update');

    Route::get('closed', 'DataController@closed');

    // ROLE ADMINISTRATION SAFE METHOD
    Route::put('role', 'RoleController@update');
    Route::resource('role', 'RoleController');

    // PRODUCT  SAFE METHOD
    Route::delete('product/{id}', 'ProductController@destroy');
    Route::post('product', 'ProductController@store');
    Route::post('product/{id}', 'ProductController@update');
    Route::resource('product_price_log', 'ProductPriceLogController');

    // PURCHASE SAFE METHOD
    Route::post('purchase', 'PurchaseController@store');
    Route::get('purchase/{id}', 'PurchaseController@show');

    // Linking
    Route::post('product_linking', 'ProductLinkingController@store');

});

// BASIC METHODS
Route::post('register', 'UserController@register');
Route::post('login', 'UserController@authenticate');
Route::get('open', 'DataController@open');

// PRODUCT OPEN METHODS
Route::get('product/{id}', 'ProductController@show');
Route::get('product_list', 'ProductController@list');
Route::get('product', 'ProductController@index');

Route::resource('purchase_detail', 'PurchaseDetailController');
Route::resource('stock', 'StockController');

//Route::resource('customer', 'CustomerController');
//Route::resource('product_purchase_log', 'ProductPurchaseLogController');



