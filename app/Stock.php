<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Stock extends Model
{
    const AVAILABLE = 'available';
    const NOT_AVAILABLE = 'not available';

    protected $fillable = [
    	'id_stock',
    	'id_product',
    	'status_stock'
    ];
}
