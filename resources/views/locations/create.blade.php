{{-- \resources\views\locations\create.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Add Location')

@section('content')   
    <h4><i class='fa fa-map-signs'></i> Add New Location</h4>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">

                <div class="panel-heading"><h5><i class='fa fa-check-circle-o'></i> Create new location here</h5></div>

                <div class="panel-body">

                    {{-- Show errrors for input fields. --}}
                    @include('errors.list')
                
                    {{-- Using the Laravel HTML Form Collective to create our form --}}
                    {{ Form::open(array('route' => 'locations.store')) }}
                    <div class="form-group">
                        {{ Form::label('name', 'Name:') }}
                        {{ Form::text('name', '', array('class' => 'form-control','placeholder' => 'Location Name')) }}
                    </div>
                    <br>
                    <div class="from-group">
						{{ Form::button('<i class="fa fa-plus-circle"> Add Location</i>', ['type' => 'submit', 'class' => 'btn btn-success btn-sm pull-right']) }}
						<a href="{{ route('locations.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>     
                </div>
            </div>
        </div>
    </div>
@endsection