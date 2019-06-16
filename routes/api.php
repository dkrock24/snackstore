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
    Route::get('closed', 'DataController@closed');
    Route::resource('role', 'RoleController');

    // PRODUCT SAFE METHOD
    Route::delete('product/{id}', 'ProductController@destroy');
    Route::post('product', 'ProductController@store');
    Route::post('product/{id}', 'ProductController@update');

    // PURCHASE SAFE METHOD
    Route::post('purchase', 'PurchaseController@store');
    Route::get('purchase/{id}', 'PurchaseController@show');
});

Route::post('register', 'UserController@register');
Route::post('login', 'UserController@authenticate');
Route::get('open', 'DataController@open');

// PRODUCT OPEN METHOD
Route::get('product/{id}', 'ProductController@show');



Route::resource('product_linking', 'ProductLinkingController');
Route::resource('product_price_log', 'ProductPriceLogController');
Route::resource('product_purchase_log', 'ProductPurchaseLogController');
Route::resource('stock', 'StockController');
Route::resource('customer', 'CustomerController');
//Route::resource('role', 'RoleController');

Route::resource('purchase_detail', 'PurchaseDetailController');

