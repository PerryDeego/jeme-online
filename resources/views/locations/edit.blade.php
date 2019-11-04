{{-- \resources\views\locations\create.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Add Location')

@section('content')   
    <h4><strong><i class='fa fa-map-signs'></i> Edit Location - {{ $location->name }}</h4></strong>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">

            <div class="panel-heading"><h5><i class='fa fa-edit'></i> edit location here</h5></div>

                <div class="panel-body">

                    {{-- Show errrors for input fields. --}}
                    @include('errors.list')
                
                    {{-- Using the Laravel HTML Form Collective to create our form --}}
                    {{ Form::model($location, array('route' => array('locations.update', $location->id), 'method' => 'PUT')) }}
                    {{-- Form model binding to automatically populate our fields with user data --}}

                    <div class="form-group">
                        {{ Form::label('name', 'Location Name:') }}
                        {{ Form::text('name', null, array('class' => 'form-control')) }}
                    </div>
					<div class="form-group">
                        {{ Form::label('user_id', 'Created By:') }}
                        {{ Form::text('user_id', $location->User()->pluck('name')->implode(' '), array('class' => 'form-control', 'readonly' => 'true')) }}
                    </div>
                    <br>
                    <div class="from-group">
						{{ Form::button('<i class="fa fa-edit"> Edit Location</i>', ['type' => 'submit', 'class' => 'btn btn-warning btn-sm pull-right']) }}
						<a href="{{ route('locations.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>     
                </div>
            </div>
        </div>
    </div>
@endsection