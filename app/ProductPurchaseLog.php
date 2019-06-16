<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductPurchaseLog extends Model
{
    const AVAILABLE = 'available';
    const NOT_AVAILABLE = 'not available';

    protected $fillable = [
    	'id_purchase',
    	'id_product',
    	'id_customer',
    	'total_items'
    ];
}
