<?php

namespace App\Http\Middleware;

use Closure;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class UserStatusMiddleware
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
        $response = $next($request);

        //If User is not active redirect to login page.
        if(Auth::check() && Auth::user()->status == false) {
            Auth::logout();
            return redirect('login')->with('status_error', 'Your account is currently inactive!');
        }

        return $response;
    }
}
