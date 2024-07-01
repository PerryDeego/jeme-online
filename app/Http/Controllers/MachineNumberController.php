<?php

namespace App\Http\Controllers;

use Auth;
use Session;
use App\Models\User;
use App\Models\building;
use App\Models\MachineNumber;
use Illuminate\Http\Request;

class MachineNumberController extends Controller
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
        $machine_numbers = MachineNumber::orderby('machine_no', 'asc')->paginate(1000); //How only 5 items at a time in descending order.
        return view('machine-numbers.index', compact('machine_numbers'))->with('i', ($request->input('page', 1) - 1) * 1000);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $buildings = Building::pluck('name','id');
        $machine_number = new MachineNumber();

        return view('machine-numbers.create', compact('buildings', 'machine_number'));
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
        'building_id' => 'required',
        'machine_no' =>'required|string|unique:machine_numbers|max:8',
        ]);

        $machine_number = new MachineNumber;

        $machine_number->user_id = Auth::user()->id;
        $machine_number->building_id = $request['building_id'];
        $machine_number->machine_no = $request['machine_no'];

        $machine_number->save();

        //Display a successful message upon save
        return redirect()->route('machine-numbers.index')->with('success_message', 'Machine Number, '. $machine_number->machine_no.' created successfully.');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(MachineNumber $machine_number)
    {
        //$machine_number = MachineNumber::findOrFail($id); //Find service installation of id = $id

        return view ('machine-numbers.show', compact('machine_number'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $machine_number = MachineNumber::findOrFail($id); //Get machine_number with specified id.
        $buildings = Building::get(); //Get all buildings 

        return view('machine-numbers.edit', compact('machine_number', 'buildings')); //Pass machine number and buildings data to view.
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
        $machine_number = MachineNumber::findOrFail($id); //Get role specified by id

		//Validate name, email and password fields    
        $this->validate($request, [
            'building_id' => 'required',
            'machine_no' =>'required|string|max:8',
        ]);

        $machine_number->modified_by = Auth::user()->name;   
        $machine_number->building_id = $request['building_id'];
        $machine_number->machine_no = $request['machine_no'];
        $machine_number->save();

        return redirect()->route('machine-numbers.index')->with('success_message', 'Machine Number & building edited.');
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
        $machine_number = MachineNumber::findOrFail($id); 
        $machine_number->delete();

        return redirect()->route('machine-numbers.index')->with('success_message', 'Machine Number successfully deleted.');
    }
}
