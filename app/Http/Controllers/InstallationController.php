<?php

namespace App\Http\Controllers;

use Auth;
use Session;
use App\Models\Installation;
use Illuminate\Http\Request;

class InstallationController extends Controller
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
        $installations = Installation::orderby('id', 'desc')->paginate(3); //How only 5 items at a time in descending order.

       return view('installations.index', compact('installations'))->with('i', ($request->input('page', 1) - 1) * 3);   
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('installations.create');
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
        'job_number' =>'required|max:8',
        'contract_number' =>'required',
        'name' =>'required',
        'erector' =>'required',
        'status' =>'required',
        'location' =>'required',
        'start_date' =>'required',
        'end_date' =>'required',
        ]);

        $job_number = $request['job_number'];
        $contract_number = $request['contract_number'];
        $name = $request['name'];
        $erector = $request['erector'];
        $status = $request['status'];
        $location = $request['location'];
        $start_date = $request['start_date'];
        $end_date = $request['end_date'];
    
        $installation = Installation::create($request->only('job_number', 'contract_number', 'name', 'erector', 'status', 'location', 'start_date', 'end_date'));

        //Display a successful message upon save
        return redirect()->route('installations.index')->with('success_message', 'Installation, '. $installation->job_number.' created');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $installations = Installation::findOrFail($id); //Find service installation of id = $id

        return view ('installations.show', compact('installation'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $installation = Installation::findOrFail($id);

        return view('installations.edit', compact('installation'));
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
            'job_number' =>'required|max:8',
            'contract_number' =>'required',
            'name' =>'required',
            'erector' =>'required',
            'status' =>'required',
            'location' =>'required',
            'start_date' =>'required',
            'end_date' =>'required',
        ]);

        $installation = Installation::findOrFail($id);
        $installation->job_number = $request->input('job_number');
        $installation->contract_number = $request->input('contract_number');
        $installation->name = $request->input('name');
        $installation->erector = $request->input('erector');
        $installation->status = $request->input('status');
        $installation->location = $request->input('location');
        $installation->start_date = $request->input('start_date');
        $installation->end_date = $request->input('end_date');
        
        $installation->save();

        return redirect()->route('installations.index', $installation->id)->with('success_message', 'Installation, '. $installation->job_number.' updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $installation = Installation::findOrFail($id);
        $installation->delete();

        return redirect()->route('installations.index')->with('success_message', 'Installation, '. $installation->job_number.' successfully deleted');
    }
}
