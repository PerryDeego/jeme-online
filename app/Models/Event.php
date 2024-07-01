<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    protected $fillable = [
        'user_id', 
        'event_name',
        'start_date', 
        'end_date', 
        'modified_by', 
        'status'
    ];


    //Relationship for a user to log many Event.
    public function user()
    {
        return $this->belongsTo('App\Models\User');
    }
}
