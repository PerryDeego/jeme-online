<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    protected $fillable = ['fault_id', 'image_path'];

    //Relationship between Image and Fault.
    public function fault()
    {
        return $this->belongsTo(Fault::class);
    }
}
