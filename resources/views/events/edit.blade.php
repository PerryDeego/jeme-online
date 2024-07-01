{{-- \resources\views\events\edit.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Add Building')

@section('content')   
<h4><strong><i class='fa fa-gear'></i> Edit Event - {{$event->event_name}}</h4></strong>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">

                <div class="panel-heading"><h5><i class='fa fa-edit'></i> edit event here</h5></div>

                <div class="panel-body">

                    {{-- Show errrors for input fields. --}}
                    @include('errors.list')
                
                    {{-- Using the Laravel HTML Form Collective to create our form --}}
                    {{ Form::model($event, array('route' => array('events.update', $event->id), 'method' => 'PUT')) }}
                    {{-- Form model binding to automatically populate our fields with user data --}}

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
					<div class="form-group">
						{{ Form::label('status', 'Status*: &nbsp;') }}
						{{ Form::radio('status', 'open', 'true') }} {{ Form::label('open', 'Open') }}
						{{ Form::radio('status', 'close', 'false') }} {{ Form::label('close', 'Close') }}
					</div>
					<div class="form-group">
                        {{ Form::label('user_id', 'Created By:') }}
                        {{ Form::text('user_id', $event->User()->pluck('name')->implode(' '), array('class' => 'form-control', 'readonly' => 'true')) }}
					</div>
					<br>
                    <div class="from-group">
						{{ Form::button('<i class="fa fa-edit"> Edit Event</i>', ['type' => 'submit', 'class' => 'btn btn-warning btn-sm pull-right']) }}
						<a href="{{ route('events.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>    
                </div>
            </div>
        </div>
    </div>
@endsection