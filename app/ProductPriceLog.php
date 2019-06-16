<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductPriceLog extends Model
{
    const AVAILABLE = 'available';
    const NOT_AVAILABLE = 'not available';

    protected $fillable = [
    	'id_price_log',
    	'id_product',
    	'last_price'
    ];
}
