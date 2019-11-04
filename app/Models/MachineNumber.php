<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MachineNumber extends Model
{
    Protected $fillable = [
        'user_id', 
        'building_id', 
        'machine_no',
        'modified_by'
    ];

    //Relationship between machine number and user.
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    //Relationship between MachineNumber and Building.
    public function building()
    {
        return $this->belongsTo(Building::class);
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
