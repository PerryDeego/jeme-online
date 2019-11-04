<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Fault extends Model
{
    protected $fillable = [
        'user_id',
        'service_id',
        'date',
        'building_id',
        'location_id', 
        'machine_id',
        'issue',
        'status',
        'modified_by', 
    ];

    //Relationship between fault and user.
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }

    public function images()
    {
    	return $this->hasMany(Image::class);
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
