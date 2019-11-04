{{-- \resources\views\service-numbers\create.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Add Service Number')

@section('content')   
    <h4><i class='fa fa-gear'></i> Add New Service Number</h4>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">

                <div class="panel-heading"><h5><i class='fa fa-check-circle-o'></i> Create new service number here</h5></div>

                <div class="panel-body">

                    {{-- Show errrors for input fields. --}}
                    @include('errors.list')
                
                    {{-- Using the Laravel HTML Form Collective to create our form --}}
                    {{ Form::open(array('route' => 'service-numbers.store')) }}
                    <div class="form-group">
                        {{ Form::label('service_no', 'Service Number:') }}
                        {{ Form::text('service_no', '', array('class' => 'form-control','placeholder' => 'Service Number')) }}
                    </div>
                    <br>
                    <div class="from-group">
						{{ Form::button('<i class="fa fa-plus-circle"> Add Service No.</i>', ['type' => 'submit', 'class' => 'btn btn-success btn-sm pull-right']) }}
						<a href="{{ route('service-numbers.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>     
                </div>
            </div>
        </div>
    </div>
@endsection