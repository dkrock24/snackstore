<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    const AVAILABLE = 'available';
    const NOT_AVAILABLE = 'not available';

    protected $fillable = [
    	'id_role',
    	'name_role'
    ];
}
