{{-- \resources\views\machine-numbers\create.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Add Machine Number')

@section('content')   
    <h4><i class='fa fa-gears'></i> Add New Machine Number</h4>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">

                <div class="panel-heading"><h5><i class='fa fa-check-circle-o'></i> create new machine number here</h5></div>

                <div class="panel-body">

                    {{-- Show errrors for input fields. --}}
                    @include('errors.list')
                
                    {{-- Using the Laravel HTML Form Collective to create our form --}}
                    {{ Form::open(array('route' => 'machine-numbers.store')) }}
                    <div class="form-group">
                        {{ Form::label('machine_no', 'Machine No.:') }}
                        {{ Form::text('machine_no', '', array('class' => 'form-control','placeholder' => 'Machine number')) }}
                    </div>
                    <div class="form-group">
                        {!! Form::label('building_id', 'building:') !!}
                        {!! Form::select('building_id', $buildings, null, ['placeholder' => 'Select building...', 'class' => 'form-control']) !!}
                    </div>
                    <br>
                    <div class="from-group">
						{{ Form::button('<i class="fa fa-plus-circle"> Add Machine</i>', ['type' => 'submit', 'class' => 'btn btn-success btn-sm pull-right']) }}
						<a href="{{ route('machine-numbers.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>    
                </div>
            </div>
        </div>
    </div>
@endsection