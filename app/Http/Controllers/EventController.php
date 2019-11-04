<?php

namespace App\Http\Controllers;

use Auth;
use Session;
use Calendar;
use Carbon\Carbon;
use App\Models\Event;

use Illuminate\Http\Request;

class EventController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
       //Get all events and pass it to the view.
        $events = Event::with('user')->paginate(1000); //Show only 10 items at a time in descending order.

        //Values to show calendar.
        $evnts = Event::get();
        $event_list = [];
        
    	foreach ($evnts as $key => $event) {
    		$event_list[] = Calendar::event(
                $event->event_name,
                true,
                new \DateTime($event->start_date),
                new \DateTime($event->end_date.' +1 day')
            );
        }
        
    	$calendar_details = Calendar::addEvents($event_list); 
 
        return view('events.index', compact('events', 'calendar_details'))->with('i', ($request->input('page', 1) - 1) * 1000);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('events.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'event_name' => 'required|string',
            'start_date' => 'required|date|',
            'end_date' => 'required|date|after_or_equal:start_date',
            'status' =>  'required',
        ]);
 
        $event = new Event();

        $event->user_id = Auth::user()->id;
        $event->event_name = $request['event_name'];
        $event->start_date = \Carbon\Carbon::parse($request['start_date'])->format('Y-m-d');
        $event->end_date = \Carbon\Carbon::parse($request['end_date'])->format('Y-m-d');
        $event->status = $request['status'];

        $log = $event->save();

        // Validate if event instance was created.
        if ($log) {
            return redirect()->route('events.index')->with('success_message', 'Event successfully added.');
        } else {
            return redirect()->route('events.index')->with('error_message', 'Failed To create Calendar Event!');
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $event = Event::findOrFail($id);

        return view('events.edit', compact('event'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $event = Event::findOrFail($id);

        return view('events.edit', compact('event'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $event = Event::findOrFail($id); //Get role specified by id

        $this->validate($request, [
            'event_name' => 'required|string',
            'start_date' => 'required|date',
            'end_date' => 'required|date|after_or_equal:date',
            'status' =>  'required',
        ]);

        $event->user_id = Auth::user()->id;
        $event->event_name = $request['event_name'];
        $event->start_date = \Carbon\Carbon::parse($request['start_date'])->format('Y-m-d');
        $event->end_date = \Carbon\Carbon::parse($request['end_date'])->format('Y-m-d');
        $event->status = $request['status'];
        $event->modified_by = Auth::user()->name;

        $log = $event->save();

        // Validate if event instance was created.
        if ($log) {
            return redirect()->route('events.index')->with('success_message', 'Event successfully updated.');
        } else {
            return redirect()->route('events.index')->with('error_message', 'Failed to update event!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Event  $event
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $event= Event::findOrFail($id);
       $event->delete();

        return redirect()->route('events.index')->with('success_message', 'Event, '.$event->name.' successfully deleted');

    }
}
