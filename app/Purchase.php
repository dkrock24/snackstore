<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    const AVAILABLE = 'available';
    const NOT_AVAILABLE = 'not available';

    protected $fillable = [
    	'id',
    	'id_customer'
    ];
}
