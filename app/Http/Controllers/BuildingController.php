<?php

namespace App\Http\Controllers;

use Auth;
use Session;
use App\Models\User;
use App\Models\Building;
use App\Models\Location;
use App\Models\ServiceNumber;
use Illuminate\Http\Request;

class BuildingController extends Controller
{
    // Allow access ecpet for index and show Views.
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
        $buildings = Building::orderby('name', 'asc')->paginate(1000);  
        return view('buildings.index', compact('buildings'))->with('i', ($request->input('page', 1) - 1) * 1000);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $service_numbers = ServiceNumber::pluck('service_no', 'id');
        $locations = Location::pluck('name','id');
        $building = new Building();

        return view('buildings.create', compact('service_numbers', 'locations', 'building'));
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
        'service_id' => 'required|unique:buildings',
        'location_id' => 'required',
        'name' =>'required|string|unique:buildings|max:100',
        ]);

        $building = new Building();

        $building->user_id = Auth::user()->id;
        $building->service_id = $request['service_id'];
        $building->location_id = $request['location_id'];
        $building->name = $request['name'];

        $building->save();

        //Display a successful message upon save
        return redirect()->route('buildings.index')->with('success_message', 'Building name : '. $building->name.' created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Building $building)
    {
       // $building = Building::findOrFail($id); //Find service installation of id = $id
        return view ('buildings.show', compact('building'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $building = Building::findOrFail($id); //Get machine_number with specified id.
        $service_numbers = ServiceNumber::get(); //Get all buildings
        $locations = Location::get(); //Show only 5 items at a time in descending order.

        return view('buildings.edit', compact('building', 'service_numbers', 'locations')); //Pass building name and locations data to view.
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
        $building = Building::findOrFail($id); //Get role specified by id

		//Validate name, email and password fields    
        $this->validate($request, [
            'service_id' => 'required',
            'location_id' => 'required',
            'name' =>'required|string|max:100',
        ]);

        $building->user_id = Auth::user()->id;
        $building->service_id = $request['service_id'];
        $building->location_id = $request['location_id'];
        $building->name = $request['name'];
        $building->modified_by = Auth::user()->name;
       
        $building->save();
    
        return redirect()->route('buildings.index')->with('success_message', 'Building name : updated successfully.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //Find a Building Name with a given id and delete
        $building = Building::findOrFail($id); 
        $building->delete();

        return redirect()->route('buildings.index')->with('success_message', 'Building Name successfully deleted.');
    }

    public function search(Request $request)
    {
    
		if($request->has('search')) {
            $buildings = Building::find('search');  
            
        }
        
        if($buildings) {
            return view('buildings.index', compact('buildings'));
        }
        else{
            return redirect()->route('buildings.index')->with('success_message', 'No User exist with that details.');
        } //End else.
    }
}
