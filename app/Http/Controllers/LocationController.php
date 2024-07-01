<?php

namespace App\Http\Controllers;

use Auth;
use Session;
use App\Models\User;
use App\Models\Location;
use Illuminate\Http\Request;

class LocationController extends Controller
{
    // Allow access excpetion for index and show Views.
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
        //Get all users and pass it to the view
        $locations = Location::with('user')->paginate(1000); //Show only 10 items at a time in descending order.
    
        return view('locations.index', compact('locations'))->with('i', ($request->input('page', 1) - 1) * 1000);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('locations.create');
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
        'name' =>'required|string',
        ]);

        $location = new Location;

        //This will store the current logged in user id in user_id field
        $location->user_id = Auth::user()->id;
        $location->name = $request['name'];

        $location->save();

        //Display a successful message upon save
        return redirect()->route('locations.index')->with('success_message', 'location, '. $location->name.' created');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $location = Location::findOrFail($id); //Find service location of id = $id

        return view ('locations.show', compact('location'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $location = Location::findOrFail($id);

        return view('locations.edit', compact('location'));
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
        $this->validate($request, [
            'name' =>'required|string',
        ]);

        $location = Location::findOrFail($id);
        $location->name = $request->input('name'); 
        $location->modified_by = Auth::user()->name;     
        
        $location->save();

        return redirect()->route('locations.index', $location->id)->with('success_message', 'location, '. $location->name.' updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $location = Location::findOrFail($id);
        $location->delete();

        return redirect()->route('locations.index')->with('success_message', 'location, '. $location->name.' successfully deleted');
    }
}
