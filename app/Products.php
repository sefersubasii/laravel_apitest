<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Products extends Model
{
    protected $guarded=[];

    public function stockproduct()
    {
        return $this->belongsToMany("App\Products_Stock","Product");
    }
}
