<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Building extends Model
{
    protected $fillable = [
        'user_id', 
        'service_id', 
        'location_id',
        'name',
        'modified_by'
        ];

    //Relationship between service number and user.
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function faults()
    {
        return $this->hasMany(Fault::class);
    }

    public function location()
    {
        return $this->belongsTo(Location::class);
    }
    
    //Relationship MachineNumber and Building name.
    public function machines()
    {
        return $this->hasMany(MachineNumber::class);
    }

    public function service()
    {
        return $this->belongsTo(ServiceNumber::class);
    }
   
    public function serviceOrders()
    {
        return $this->hasMany(ServiceOder::class);
    }
}