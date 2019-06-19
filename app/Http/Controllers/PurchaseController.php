<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Purchase;
use App\PurchaseDetail;
use App\Product;

class PurchaseController extends Controller
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
        if(auth()->user()->role != 1){
            $purchase = new Purchase;

            $purchase->id_customer = auth()->user()->id;//$request->customer;

            $succes = $purchase->save();

            if($succes){
                $this->savePurchaseDetail($purchase->id,$request);
                
                app('App\Http\Controllers\ProductController')->updateStock($request->product, $request->quantity);
            }
            return "Purchase Done";
        }else{
            return "Only Customers can Purchase Products";
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
        //return Purchase::where('id',$id)->get();

        $data = DB::table("purchases")
                ->select("*")
                ->join('purchase_details', 'purchase_details.id_purchase', '=', 'purchases.id')
                ->join('users', 'users.id', '=', 'purchases.id_customer')
                ->get();

        return $data;
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
        //
    }

    public function savePurchaseDetail($purchase_id , $product){
        
        $purchaseDetail = new PurchaseDetail;

        $purchaseDetail->id_purchase = $purchase_id;
        $purchaseDetail->id_product = $product['product'];
        $purchaseDetail->quantity = $product['quantity'];

        $purchaseDetail->save();
    }
}
