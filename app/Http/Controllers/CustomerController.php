<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Input;
use Illuminate\Http\Request;
use App\Customer;

class CustomerController extends Controller
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
        $customer = new Customer;

        $pwd = $this->encryp($request->password);

        $customer->firstname_customer = $request->firstname;
        $customer->lastname_customer = $request->lastname;
        $customer->username_customer = $request->username;
        $customer->password_customer = $pwd;
        $customer->status_customer = $request->status;

        // Savev Model
        $customer->save();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return Customer::where('id_customer', $id )->get();
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
        $password = Input::get('password');
        $customer = Customer::find($id);

        $pwd = $this->encryp($password);
        
        $customer->firstname_customer = Input::get('firstname');
        $customer->lastname_customer = Input::get('lastname');
        $customer->username_customer = Input::get('username');
        $customer->password_customer = $pwd;
        $customer->status_customer = Input::get('status');

        // Savev Model
        $customer->save();
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

    public function encryp($passwd){
        return sha1($passwd);
    }
}
