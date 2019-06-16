<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ProductLinking;

class ProductLinkingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //Instance of Product Linking
        $productLinking = new ProductLinking;

        $productLinking->id_product = $request->product;
        $productLinking->id_customer = $request->customer;

        $exist = $this->validateLike($request->product , $request->customer );
//        var_dump($exist[0]['id']);
        if(!isset($exist[0]['id'])){
            // Save Model
            $productLinking->save();
        }else{
            echo 1;
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return ProductLinking::where('id', $id)->get();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $productLinking = ProductLinking::find($id);
        $productLinking->delete();
    }

    public function validateLike( $product , $customer ){
        
        return ProductLinking::where('id_product',$product)->where('id_customer',$customer)->get();

    }
}
