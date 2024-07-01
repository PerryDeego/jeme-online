<?php

namespace App\Http\Middleware;

use Closure;
use Session;
use Illuminate\Support\Facades\Auth;

class ClearanceMiddleware
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
        if (Auth::user()->hasPermissionTo('Super-admin roles & permissions') && Auth::user()->status == 1) //If user has this //permission
        {
            return $next($request);
        }

        if ($request->is('jobs/create'))//If user is creating a jobs
        {
            if (!Auth::user()->hasPermissionTo('Create Jobs'))
            {
                abort('401');
            } 
            else 
            {
                return $next($request);
            } //end else
        }

        if ($request->is('jobs/*/edit')) //If user is editing a jobs
        {
            if (!Auth::user()->hasPermissionTo('Edit Jobs')) 
            {
                abort('401');
            } else 
            {
                return $next($request);
            } //end else
        }

        if ($request->isMethod('Delete')) //If user is deleting a jobs
        {
            if (!Auth::user()->hasPermissionTo('Delete Jobs'))
            {
                abort('401');
            } 
            else 
            {
                return $next($request);
            } //end else
        }

        return $next($request);
    }
}