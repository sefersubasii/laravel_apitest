<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Products_Stock extends Model
{
    protected $guarded=[];
    public $timestamps = false;

    public function product()
    {
        return $this->belongsToMany("App\Product","Products_Stock");
    }
}
