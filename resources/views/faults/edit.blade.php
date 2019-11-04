{{-- \resources\views\fault\edit.blade.php --}}

@extends('layouts.app-template')

@section('title', '| Log New Fault')

@section('content')
<h4><i class='fa fa-file-text'></i> Edit Fault</h4>
    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading"><h5><i class='fa fa-edit'></i> Edit Fault</h5></div>
                <div class="panel-body">
					
					{{-- Show errrors for input fields. --}}
					@include('errors.list')
					
					{{-- Using the Laravel HTML Form Collective to create our form --}}
					{{ Form::model($fault, array('route' => array('faults.update', $fault->id), 'method' => 'PUT')) }}
					
					<div class="from-group row">
						<div class="col-xs-4">
							{{ Form::label('service_id', 'Service No.:') }}
							{{ Form::select('service_id', $service_numbers, null, ['class' => 'form-control']) }}
						</div>
						<div class="col-xs-8">
							{{ Form::label('date', 'Date:') }}
							<div class="input-group margin-bottom-xs">
								<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
								{!! Form::text ('date', null, ['class' => 'form-control', 'placeholder'=>'Date picker...']) !!}
							</div>
						</div>
					</div>
					<br>
					<div class="from-group row">
						<div class="col-xs-6">
							{{ Form::label('building_id', 'Building Name:') }}
							{{ Form::select('building_id', $buildings, null, ['class' => 'form-control']) }}
						</div>
						<div class="col-xs-6">
							{!! Form::label('location_id', 'Location:') !!}
							{!! Form::select('location_id', $locations, null, ['class' => 'form-control']) !!}
						</div>
					</div>
					<br>
					<div class="from-group row">
						<div class="col-xs-6">
							{{ Form::label('machine_id', 'Machine No.:') }}
							{{ Form::select('machine_id', $machine_numbers, null, ['class' => 'form-control']) }}					
						</div>
						<div class="col-xs-2">
							{{ Form::label('status', 'Fault Closed?') }}
							{{ Form::select('status', [ 'Yes' => 'Yes', 'No' => 'No'], $fault->status, ['class' => 'form-control']) }}
						</div>
						<div class="col-xs-4">
							{{ Form::label('user_id', 'Created By') }}
							{{ Form::text('user_id', $fault->User()->pluck('name')->implode(' '), array('class' => 'form-control', 'readonly' => 'true')) }}
						</div>
					</div>
					<br>
					<div class="from-group row">
						<div class="col-xs-12">
							{{ Form::label('issue', 'Fault Descrition:') }}
							{!! Form::textarea('issue', null, ['placeholder' => '*Add issue description here...', 'class'=>'form-control', 'rows' => 8]) !!}
						</div>
					</div>
					<br><br>
					<div class="from-group">
						@if(!$images->isEmpty())
						<h4 class="text-center">{{ Form::label('images', 'Saved images that can be updated.') }}</h4>
							@foreach($images as $image)
								<div class="img_container">
									<a href="#">
										<img src="{{ URL::to('images/fault_images/'.$image)}}" alt="image" title="Fault Image">
									</a>
									{{ $image }}
								</div>
							@endforeach
							<br>
							{{ Form::label('images', 'You can save multiple images:') }} <br>
							{{ Form::file('images[]', array('id'=>'images', 'multiple'=>true)) }} <br>
						@endif
					
					</div>
					<br>		
					<div class="from-group">
						{{ Form::button('<i class="fa fa-edit"> Edit Fault</i>', ['type' => 'submit', 'class' => 'btn btn-warning btn-sm pull-right']) }}
						<a href="{{ route('faults.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div> 
				</div>
			</div>
		</div>
	</div>	
	
@endsection