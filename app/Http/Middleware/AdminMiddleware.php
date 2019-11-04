<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $user = User::all()->count();
        
        if (!($user == 1)) 
        {
            if (!Auth::user()->hasPermissionTo('Super-admin roles & permissions') || !Auth::user()->status == 1) //If user does //not have this permission
            {
                abort('401');
            }

        } //end if

        return $next($request);
    }
}
