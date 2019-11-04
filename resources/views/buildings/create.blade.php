{{-- \resources\views\buildings\create.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Add Building')

@section('content')   
    <h4><i class='fa fa-building'></i> Add New Building</h4>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">

                <div class="panel-heading"><h5><i class='fa fa-check-circle-o'></i>Create new building here</h5></div>

                <div class="panel-body">

                    {{-- Show errrors for input fields. --}}
                    @include('errors.list')
                
                    {{-- Using the Laravel HTML Form Collective to create our form --}}
                    {{ Form::open(array('route' => 'buildings.store')) }}
					<div class="form-group">
                        {{ Form::label('name', 'Name') }}
                        {{ Form::text('name', '', array('class' => 'form-control','placeholder' => 'Building Name')) }}
                    </div>
                    <div class="form-group">
                        {!! Form::label('service_id', 'Service No') !!}
                        {!! Form::select('service_id', $service_numbers, null, ['placeholder' => 'Select service number...', 'class' => 'form-control']) !!}
                    </div>
					<div class="form-group">
                        {!! Form::label('location_id', 'Location') !!}
                        {!! Form::select('location_id', $locations, null, ['placeholder' => 'Select location...', 'class' => 'form-control']) !!}
                    </div>
                    <br>
                    <div class="from-group">
						{{ Form::button('<i class="fa fa-plus-circle"> Add Building</i>', ['type' => 'submit', 'class' => 'btn btn-success btn-sm pull-right']) }}
						<a href="{{ route('buildings.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>     
                </div>
            </div>
        </div>
    </div>
@endsection