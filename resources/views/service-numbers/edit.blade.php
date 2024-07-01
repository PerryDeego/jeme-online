{{-- \resources\views\service-numbers\edit.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Add Service Number')

@section('content')   
    <h4><i class='fa fa-gear'></i> Edit Service Number</h4>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">

                <div class="panel-heading"><h5><i class='fa fa-edit'></i> edit service number here</h5></div>

                <div class="panel-body">

                    {{-- Show errrors for input fields. --}}
                    @include('errors.list')
                
                    
                    {{-- Using the Laravel HTML Form Collective to create our form --}}
                    {{ Form::model($service_number, array('route' => array('service-numbers.update', $service_number->id), 'method' => 'PUT')) }}
                  
                    <div class="form-group">
                        {{ Form::label('service_no', 'Service No.:') }}
                        {{ Form::text('service_no', null, array('class' => 'form-control')) }}
                    </div>
					<div class="form-group">
                        {{ Form::label('user_id', 'Created By:') }}
                        {{ Form::text('user_id', $service_number->User()->pluck('name')->implode(' '), array('class' => 'form-control', 'readonly' => 'true')) }}
                    </div>
                    <br>
                    <div class="from-group">
						{{ Form::button('<i class="fa fa-edit"> Edit Service No.</i>', ['type' => 'submit', 'class' => 'btn btn-warning btn-sm pull-right']) }}
						<a href="{{ route('service-numbers.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>     
                </div>
            </div>
        </div>
    </div>
@endsection