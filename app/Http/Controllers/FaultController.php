<?php

namespace App\Http\Controllers;

use Auth;
use App\Models\Building;
use App\Models\Fault;
use App\Models\Image;
use App\Models\Location;
use App\Models\MachineNumber;
use App\Models\ServiceNumber;
use Illuminate\Http\Request;

class FaultController extends Controller
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
        $faults = Fault::orderby('id', 'desc')->paginate(1000); //How only 5 items at a time in descending order.

       return view('faults.index', compact('faults'))->with('i', ($request->input('page', 1) - 1) * 1000);   
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $buildings = Building::pluck('name', 'id');
        $locations = Location::pluck('name', 'id');
        $machine_numbers = MachineNumber::pluck('machine_no','id');
        $service_numbers = ServiceNumber::pluck('service_no','id');

        return view('faults.create', compact('buildings', 'locations', 'machine_numbers', 'service_numbers'));
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
            'service_id' => 'required|max:8',
            'date' =>'required|date',
            'building_id' => 'required',
            'location_id' => 'required', 
            'machine_id' => 'required',
            'issue' =>'required',
            'status' =>'required',
            'images' => 'nullable',
            'images*.' =>'nullable|images|mimes:jpeg,png,bmp,jpg,gif,svg|max:5120'
        ]);

        $fault = new Fault;
        $fault->user_id = Auth::user()->id;
        $fault->service_id = $request['service_id'];
        $fault->date = \Carbon\Carbon::parse($request['date'])->format('Y-m-d');
        $fault->building_id = $request['building_id'];
        $fault->location_id = $request['location_id'];
        $fault->machine_id = $request['machine_id'];
        $fault->issue = $request['issue'];
        $fault->status = $request['status'];
        
        $check = $fault->save();

        try {
            if($check && $request->hasFile('images')){
                $images = $request->file('images');
                foreach ($images as $image) {

                    $filename = $image->getClientOriginalName();               
                    $path = public_path('/images/fault_images');
                
                    $image->move($path, $filename);

                    Image::create([
                        'fault_id' => $fault->id,
                        'image_path' => $filename,
                    ]);
                }
                    
            } 
        } catch (ModelNotFoundException $exception) {
            return back()->withError($exception->getMessage())->withInput();
        }
        
        return redirect()->route('faults.index')->with('success_message', 'Fault log created successfully.'); 
       
    }

  
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $fault = Fault::findOrFail($id); //Find service fault of id = $id
        $images = Image::where('fault_id', $id)
        ->pluck('image_path');

        return view ('faults.show', compact('fault', 'images'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $fault = Fault::findOrFail($id);
        //$images = Image::findOrFail($id);
        $buildings = Building::pluck('name', 'id');
        $images = Image::where('fault_id', $id)
        ->pluck('image_path');
        $locations = Location::pluck('name', 'id');
        $machine_numbers = MachineNumber::pluck('machine_no','id');
        $service_numbers = ServiceNumber::pluck('service_no','id');

        return view('faults.edit', compact('fault', 'buildings', 'locations', 'machine_numbers', 'service_numbers', 'images'));
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
            'service_id' => 'required|max:8',
            'date' =>'required',
            'building_id' => 'required',
            'location_id' => 'required', 
            'machine_id' => 'required',
            'issue' =>'required',
            'status' =>'required',
            'images' => 'nullable',
            'images*.' =>'nullable|images|mimes:jpeg,png,jpg,gif,svg|max:5120'
        ]);

        $fault = Fault::findOrFail($id);
        $images = Image::findOrFail($id);

        $fault->user_id = Auth::user()->id;
        $fault->service_id = $request['service_id'];
        $fault->date = \Carbon\Carbon::parse($request['date'])->format('Y-m-d');
        $fault->building_id = $request['building_id'];
        $fault->location_id = $request['location_id'];
        $fault->machine_id = $request['machine_id'];
        $fault->issue = $request['issue'];
        $fault->status = $request['status'];
        
        $fault->save();
        //Save if fault updated and images exist.
        try {
            if($fault && $request->hasFile('images')){
                $images = $request->file('images');
                foreach ($images as $image) {

                    $filename = $image->getClientOriginalName();               
                    $path = public_path('/images/fault_images');
                
                    $image->move($path, $filename);

                    Image::create([
                        'fault_id' => $fault->id,
                        'image_path' => $filename,
                    ]);
                }
                    
            } 
        } catch (ModelNotFoundException $exception) {
            return back()->withError($exception->getMessage())->withInput();
        }

        return redirect()->route('faults.index', $fault->id)->with('success_message', 'fault, '. $fault->job_number.' updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $fault = fault::findOrFail($id);
        $fault->delete();

        if($fault)
        {
            $delete=Image::findOrFail($id);
           // $image_path=public_path().'/images/fault_images'.$delete->image;
        }
        

        return redirect()->route('faults.index')->with('success_message', 'fault, '. $fault->job_number.' successfully deleted');
    }
}