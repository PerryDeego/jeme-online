<?php

namespace App\Models;

use Spatie\Permission\Traits\HasRoles;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;


class User extends Authenticatable
{
    use HasRoles;
    use Notifiable;

    protected $guard_name = 'web';
   
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id', 
        'name', 
        'email', 
        'password', 
        'status',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    //Mutator which encrypt all password fields. 
    public function setPasswordAttribute($password)
    {   
        $this->attributes['password'] = bcrypt($password);
    }


    //Relationship for a user to log many Events.
    public function events()
    {
        return $this->hasMany(Event::class);
    }

    //Relationship for a user to log many Building.
    public function buildings()
    {
        return $this->hasMany(Building::class);
    }

     //Relationship for a user to log many Machine Number.
     public function machineNumbers()
     {
         return $this->hasMany(MachineNumber::class);
     }

     //Relationship for a user to log many ServiceNumber.
    public function serviceNumbers()
    {
        return $this->hasMany(ServiceNumber::class);
    }

    //Relationship for a user to log many Service Orders.
    public function serviceOrders()
    {
        return $this->hasMany(SeviceOrder::class);
    }

    //Relationship for a user to log many faults.
    public function faults()
    {
        return $this->hasMany(Fault::class);
    }

}
