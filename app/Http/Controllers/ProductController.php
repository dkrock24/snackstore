<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Services\LengthPager;
use App\Product;
use App\ProductPriceLog;
use App\ProductLinking;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $name = "";
        if($request->name){
            $name = $request->name;
        }
        

        If (!empty($request->input('page'))) {
            $page = $request->input('page');
        } else {
            $page = "1";
        }
        $perpage = "5";
        $offset = ($page - 1) * $perpage;

        $product_total =  $this->countProducts();
        
        $data = DB::table("products")
          ->select("products.*",
                DB::raw("(SELECT COUNT(*) FROM product_linkings AS pl2 WHERE pl2.id_product = products.id ) as total")
                )
          ->where('products.name_product', 'like', '%' . $name . '%' )
          ->orderBy('products.name_product','asc')
          ->orderBy('total','asc')
          ->get();

          $results = new \Illuminate\Pagination\LengthAwarePaginator(
            array_slice($data->toArray(), 
                ($page - 1) * 1, 2), 
                $product_total, 2, 
                $page, 
                ["path" => "search"]
            );

          return $results;
    }

    public function countProducts(){
        $total = DB::select('select COUNT(*) as count from products where status_product = :status_product', ['status_product' => 1]);
        return  $numrows = $total[0]->count;
    }

    /**
     * Display a listing of the resource by name.
     *
     * @return \Illuminate\Http\Response
     */
    public function search(Response $request){
        
        return Product::where('id', 1)->get();

        //return Product::where('name_product', 'like', '%' . $request->('name'). '%' )->get();

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
        //Instance of Product
        $product = new Product;
        
        $product->name_product = $request->name;
        $product->price_product = $request->price;
        $product->stock_product = $request->stock;
        $product->description_product = $request->description;
        $product->status_product = $request->status;

        //Save model
        $product->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return Product::where('id', $id)->get();
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
        $newPrice = Input::get('price_product');
        if($newPrice){

            $product    = Input::get('id');

            $oldPrice   = Product::where('id', $id)->get();

            $this->priceLog($product , $newPrice, $oldPrice[0]->price_product );
        }
        Product::where('id', $id)->update(Input::all());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::find($id);
        $product->delete();
    }

    public function priceLog($product , $newPrice, $oldprice){

        if($newPrice != $oldprice){

            $productPriceLog = new ProductPriceLog();

            $productPriceLog->id_product = $product;
            $productPriceLog->last_price = $newPrice;

            // Save Model
            $productPriceLog->save();
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateStock( $id , $quantity ){

        $product = Product::find($id);

        $product->stock_product = ( $product->stock_product - $quantity );
        
        $product->save();
    }
}
