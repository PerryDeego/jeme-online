{{-- \resources\views\events\create.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Add Reminders')

@section('content')   
    <h4><i class='fa fa-calendar'></i> Add New Reminders</h4>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">

                <div class="panel-heading"><h5><i class='fa fa-check-circle-o'></i> Create new reminder here</h5></div>

                <div class="panel-body">
						
                    {{-- Show errrors for input fields. --}}
                    @include('errors.list')
                
                    {{-- Using the Laravel HTML Form Collective to create our form --}}
                    {{ Form::open(array('route' => 'events.store')) }}
					
					<div class="form-group">
						{!! Form::label('event_name','Event Name:') !!}
						{!! Form::text('event_name', null, ['class' => 'form-control']) !!}
					</div>	
					<div class="form-group">
						{!! Form::label('start_date','Start Date:') !!}
						{!! Form::text('start_date', null, ['class' => 'form-control']) !!}
					</div>
					<div class="form-group">
						{!! Form::label('end_date','End Date:') !!}
						{!! Form::text('end_date', null, ['class' => 'form-control']) !!}
					</div>
					<div class="from-group">
						{{ Form::label('status', 'Status*: &nbsp;') }}
						{{ Form::radio('status', 'open', 'true') }} {{ Form::label('open', 'Open') }}
						{{ Form::radio('status', 'close', 'false') }} {{ Form::label('close', 'Close') }}
					</div>
					<br>
					<div class="from-group">
						{{ Form::button('<i class="fa fa-plus-circle"> Add Event</i>', ['type' => 'submit', 'class' => 'btn btn-success btn-sm pull-right']) }}
						<a href="{{ route('events.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>
                </div>     
            </div>
        </div>
    </div>
@endsection