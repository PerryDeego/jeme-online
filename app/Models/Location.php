<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Location extends Model
{
    protected $fillable = [
        'user_id',
        'name',
        'modified_by'
        ];

    //Relationship between location and user.
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function buildings()
    {
        return $this->hasMany(Building::class);
    }

    public function faults()
    {
        return $this->hasMany(Fault::class);
    }

    public function serviceOrders()
    {
        return $this->hasMany(ServiceOrder::class);
    }
}
