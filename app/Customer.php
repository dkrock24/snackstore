<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    const AVAILABLE = 'available';
    const NOT_AVAILABLE = 'not available';

    protected $fillable = [
    	'id_customer',
    	'firstname_customer',
    	'lastname_customer',
    	'username_customer',
    	'password_customer',
    	'status_customer'
    ];
}   