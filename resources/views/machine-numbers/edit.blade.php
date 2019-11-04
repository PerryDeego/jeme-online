{{-- \resources\views\machine-numbers\create.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Add Machine Number')

@section('content')   
    <h4><strong><i class='fa fa-gears'></i> Edit Machine Number - {{ $machine_number->machine_no }}</h4></strong>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">

                <div class="panel-heading"><h5><i class='fa fa-edit'></i> edit machine number here</h5></div>

                <div class="panel-body">

                    {{-- Show errrors for input fields. --}}
                    @include('errors.list')
                
                    {{-- Using the Laravel HTML Form Collective to create our form --}}
                    {{ Form::model($machine_number, array('route' => array('machine-numbers.update', $machine_number->id), 'method' => 'PUT')) }}
                    {{-- Form model binding to automatically populate our fields with user data --}}

                    <div class="form-group">
                        {{ Form::label('machine_no', 'Machine No.:') }}
                        {{ Form::text('machine_no', null, array('class' => 'form-control')) }}
                    </div>
                    <div class="form-group">
                        {!! Form::label('building->id', 'building:') !!}
                        <select name="building_id" id="building_id" class="form-control">
                            @foreach ($buildings as $building)
                                <option value="{{ $building->id }}" {{ $building->id == $machine_number->building_id ? 'selected' : '' }}>{{ $building->name}}</option>
                            @endforeach
                        </select>
                    </div>
					<div class="form-group">
                        {{ Form::label('user_id', 'Created By:') }}
                        {{ Form::text('user_id', $machine_number->User()->pluck('name')->implode(' '), array('class' => 'form-control', 'readonly' => 'true')) }}
                    </div>
                    <br>
                    <div class="from-group">
						{{ Form::button('<i class="fa fa-edit"> Edit Machine</i>', ['type' => 'submit', 'class' => 'btn btn-warning btn-sm pull-right']) }}
						<a href="{{ route('machine-numbers.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>     
                </div>
            </div>
        </div>
    </div>
@endsection