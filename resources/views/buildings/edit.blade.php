{{-- \resources\views\buildings\create.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Add Building')

@section('content')   
<h4><strong><i class='fa fa-building'></i> Edit Building - {{ $building->name }}</h4></strong>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">

                <div class="panel-heading"><h5><i class='fa fa-edit'></i> edit building here</h5></div>

                <div class="panel-body">

                    {{-- Show errrors for input fields. --}}
                    @include('errors.list')
                
                    {{-- Using the Laravel HTML Form Collective to create our form --}}
                    {{ Form::model($building, array('route' => array('buildings.update', $building->id), 'method' => 'PUT')) }}
                    {{-- Form model binding to automatically populate our fields with user data --}}
			
                    <div class="form-group">
                        {{ Form::label('name', 'Name') }}
                        {{ Form::text('name', null, array('class' => 'form-control')) }}
                    </div>
					<div class="form-group">
                        {!! Form::label('service_id', 'Service No') !!}
                        <select name="service_id" id="service_id" class="form-control">
                            @foreach ($service_numbers as $service_number)
                                <option value="{{ $service_number->id }}" {{ $service_number->id == $building->service_id ? 'selected' : '' }}>{{ $service_number->service_no }}</option>
                            @endforeach
                        </select>
                    </div>
					<div class="form-group">
                        {!! Form::label('location->id', 'Location') !!}
                        <select name="location_id" id="location_id" class="form-control">
                            @foreach ($locations as $location)
                                <option value="{{ $location->id }}" {{ $location->id == $building->location_id ? 'selected' : '' }}>{{ $location->name}}</option>
                            @endforeach
                        </select>
                    </div>
					<div class="form-group">
                        {{ Form::label('user_id', 'Created By') }}
                        {{ Form::text('user_id', $building->User()->pluck('name')->implode(' '), array('class' => 'form-control', 'readonly' => 'true')) }}
                    </div>
                    <br>
                    <div class="from-group">
						{{ Form::button('<i class="fa fa-edit"> Edit Building</i>', ['type' => 'submit', 'class' => 'btn btn-warning btn-sm pull-right']) }}
						<a href="{{ route('buildings.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>     
                </div>
            </div>
        </div>
    </div>
@endsection