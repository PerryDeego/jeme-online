<?php

namespace App\Http\Controllers;

use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Models\ServiceOrder;


class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $count_orders = ServiceOrder::all()->count();
        $current_month_orders = ServiceOrder::whereMonth('created_at', Carbon::today())->count();
    
		
		return view('admin/home', compact('count_orders', 'current_month_orders'));
    }

}
