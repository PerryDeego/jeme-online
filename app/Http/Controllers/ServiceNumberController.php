<?php

namespace App\Http\Controllers;

use Auth;
use Session;
use App\Models\User;
use App\Models\ServiceNumber;
use Illuminate\Http\Request;

class ServiceNumberController extends Controller
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
        $service_numbers = ServiceNumber::with('user')->orderby('service_no', 'desc')->paginate(1000); //How only 5 items at a time in descending order.
        return view('service-numbers.index', compact('service_numbers'))->with('i', ($request->input('page', 1) - 1) * 1000); 
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('service-numbers.create');
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
            'service_no' =>'required|string|unique:service_numbers|max:10',
        ]);

        $service_number = new ServiceNumber();

        $service_number->user_id = Auth::user()->id;
        $service_number->service_no = $request['service_no'];
   
        $service_number->save();

        //Display a successful message upon save
        return redirect()->route('service-numbers.index')->with('success_message', 'Service Number, '. $service_number->service_no.' created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(ServiceNumber $service_number)
    {
        //$service_number = ServiceNumber::findOrFail($id); //Find service installation of id = $id
        return view ('service-numbers.show', compact('service_number'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $service_number = ServiceNumber::findOrFail($id); //Get machine_number with specified id.
        return view('service-numbers.edit', compact('service_number')); //Pass machine number and locations data to view.
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
		//Validate name, email and password fields    
        $this->validate($request, [
            'service_no' =>'required|string|unique:service_numbers|max:10',
        ]);

        $service_number = ServiceNumber::findOrFail($id);
        
        $service_number->service_no = $request->input('service_no'); //Retreive the service_no field.
        $service_number->modified_by = Auth::user()->name;   
        $service_number->save();

        return redirect()->route('service-numbers.index', $service_number->id)->with('success_message', 'Service No:  
        '. $service_number->service_no.' updated successfully.');

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //Find a Machine Number with a given id and delete
        $machine_number = ServiceNumber::findOrFail($id); 
        $machine_number->delete();

        return redirect()->route('service-numbers.index')->with('success_message', 'Machine Number successfully deleted.');
    }
}
