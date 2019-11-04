<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ServiceNumber extends Model
{
    protected $fillable = [
        'user_id', 
        'service_no',
        'modified_by'
    ];

    //Relationship between service number and user.
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    //Relationship service number and building name.
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
        return $this->hasMany(serviceOrder::class);
    }
}
