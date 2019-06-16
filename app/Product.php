<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
	const AVAILABLE = 'available';
    const NOT_AVAILABLE = 'not available';

    protected $fillable = [
    	'id',
    	'name_product',
    	'price_product',
    	'description_product',
    	'status_product'
    ];
}