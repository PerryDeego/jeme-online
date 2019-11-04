<?php

namespace App\Http\Controllers;

use Auth;
use Session;
use App\Models\User;
use Carbon\Carbon;
use App\Models\Building;
use App\Models\Location;
use App\Models\MachineNumber;
use App\Models\ServiceNumber;
use App\Models\ServiceOrder;
use Illuminate\Http\Request;

class ServiceOrderController extends Controller
{
    public function __construct() 
    {
        $this->middleware(['auth', 'clearance'])->except('index', 'show');
    }
	
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request) 
    {
        $service_orders = ServiceOrder::orderby('order_no', 'asc')->paginate(1000); //Show only 5 items at a time in descending order.
		
        return view('service-orders.index', compact('service_orders'))->with('i', ($request->input('page', 1) - 1) * 1000); 
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //$buildings = Building::pluck('name', 'id');
       // $locations = Location::pluck('name', 'id');
       // $machine_numbers = MachineNumber::pluck('machine_no','id');
        $service_numbers = ServiceNumber::pluck('service_no','id');

        return view('service-orders.create', compact('service_numbers'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //Validating title and body field
        $this->validate($request, [
            'order_no' => 'required|integer|min:1', 
            'service_id' => 'required',
            'building_id' => 'required',
            'location_id' => 'required', 
            'machine_id' => 'required', 
            'date' => 'required|date', 
            'address' => 'required', 
            'charge_to' => 'required', 
            'customer' => 'required', 
            'no_of_person' => 'required|integer|min:1', 
            'order_type' => 'required', 
            'taken_by' => 'required', 
            'status' => 'required', 
            'work_description' => 'required', 
            ]);

        $service_order = new ServiceOrder;

        $service_order->user_id = Auth::user()->id;
        $service_order->order_no = $request['order_no'];
        $service_order->service_id = $request['service_id'];
        $service_order->building_id = $request['building_id'];
        $service_order->location_id = $request['location_id'];
        $service_order->machine_id = $request['machine_id'];
        $service_order->date = \Carbon\Carbon::parse($request['date'])->format('Y-m-d');
        $service_order->address  = $request['address'];
        $service_order->charge_to  = $request['charge_to'];
        $service_order->customer  = $request['customer'];
        $service_order->no_of_person  = $request['no_of_person'];
        $service_order->order_type = $request['order_type'];
        $service_order->taken_by = $request['taken_by'];
        $service_order->status = $request['status'];
        $service_order->work_description = $request['work_description'];
        
        $service_order->save();

        //Display a successful message upon save
        return redirect()->route('service-orders.index')->with('success_message', 'Service Order, '. $service_order->order_no.' created successfully!');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $service_order = ServiceOrder::findOrFail($id); //Find service serviceorder of id = $id

        return view ('service-orders.show', compact('service_order'));
    }
    

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $service_order = ServiceOrder::findOrFail($id);
        $buildings = Building::pluck('name', 'id');
        $locations = Location::pluck('name', 'id');
        $machine_numbers = MachineNumber::pluck('machine_no','id');
        $service_numbers = ServiceNumber::pluck('service_no','id');

        return view('service-orders.edit', compact('buildings', 'locations', 'machine_numbers', 'service_numbers', 'service_order'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $service_order = ServiceOrder::findOrFail($id); //Get role specified by id

        //Validating title and body field
        $this->validate($request, [
            'order_no' => 'required|integer|min:1', 
            'service_id' => 'required',
            'building_id' => 'required',
            'location_id' => 'required', 
            'machine_id' => 'required', 
            'date' => 'required|date', 
            'address' => 'required', 
            'charge_to' => 'required', 
            'customer' => 'required', 
            'no_of_person' => 'required|integer|min:1', 
            'order_type' => 'required', 
            'taken_by' => 'required', 
            'status' => 'required', 
            'work_description' => 'required', 
        ]);

        $service_order->user_id = Auth::user()->id;
        $service_order->order_no = $request['order_no'];
        $service_order->service_id = $request['service_id'];
        $service_order->building_id = $request['building_id'];
        $service_order->location_id = $request['location_id'];
        $service_order->machine_id = $request['machine_id'];
        $service_order->date = \Carbon\Carbon::parse($request['date'])->format('Y-m-d');
        $service_order->address  = $request['address'];
        $service_order->charge_to  = $request['charge_to'];
        $service_order->customer  = $request['customer'];
        $service_order->no_of_person  = $request['no_of_person'];
        $service_order->order_type = $request['order_type'];
        $service_order->taken_by = $request['taken_by'];
        $service_order->status = $request['status'];
        $service_order->work_description = $request['work_description'];
        
        $service_order->save();

        //Display a successful message upon save
        return redirect()->route('service-orders.index', $service_order->id)->with('success_message', 'Service serviceorder, '. $service_order->job_number.' updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $serviceorder = ServiceOrder::findOrFail($id);
        $serviceorder->delete();

        return redirect()->route('service-orders.index')->with('success_message', 'Service serviceorder successfully deleted');
    }


    //------------------------------------------------------Added list functions-------------------------------------------------------------
   
    public function list() 
    {
        $serivice_numbers = ServiceNumber::pluck("service_no","id"); //Show only 5 items at a time in descending order.
       
        return view('list', compact('serivice_numbers'));
    }
   
  
    public function getBuildingList(Request $request)
    {
        $buildings = Building::where('service_id', $request->service_id)
        ->pluck('name', 'id');

        return response()->json($buildings);
    }

    public function getLocationList(Request $request)
    {
        $location_id = Building::where('service_id', $request->building_id)
        ->pluck('location_id');

        $locations = Location::where('id', $location_id)
        ->pluck('name', 'id');

       return response()->json($locations);
    }


    public function getMachineList(Request $request)
    {
        $building_id = Building::where('service_id', $request->service_id)
        ->pluck('id');
        $machines = MachineNumber::where('building_id', $building_id)
        ->pluck('machine_no', 'id');

       return response()->json($machines);
    }    
    //------------------------------------------------------Added list functions-------------------------------------------------------------
   

	public function export()
    {
        $all_orders = ServiceOrder::orderBy('order_no', 'asc')->get();
        $pdf = PDF::loadview('service-orders.index', compact('all_orders'));
        return $pdf->download('service-order.pdf');
    }

}