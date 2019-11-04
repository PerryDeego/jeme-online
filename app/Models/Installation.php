<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Installation extends Model
{
    protected $fillable = [
        'job_number', 
        'contract_number', 
        'name', 'erector', 
        'status', 
        'location', 
        'start_date',
        'end_date'
        ];
}
