<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ServiceOrder extends Model
{
    protected $fillable = [
        'user_id',
        'order_no', 
        'service_id',
        'building_id',
        'location_id', 
        'machine_id', 
        'date',
        'address', 
        'charge_to',
        'customer',
        'no_of_person',
        'order_type',
        'taken_by', 
        'status',
        'work_description'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    
    public function building()
    {
        return $this->belongsTo(Building::class);
    }

    public function Location()
    {
        return $this->belongsTo(Location::class);
    }

    public function machine()
    {
        return $this->belongsTo(MachineNumber::class);
    }

    public function service()
    {
        return $this->belongsTo(ServiceNumber::class);
    }

}
