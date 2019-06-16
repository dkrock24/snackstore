<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductLinking extends Model
{
    const AVAILABLE = 'available';
    const NOT_AVAILABLE = 'not available';

    protected $fillable = [
    	'id_linking',
    	'id_product',
    	'id_customer'
    ];
}
