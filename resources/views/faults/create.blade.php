{{-- \resources\views\faults\create.blade.php --}}

@extends('layouts.app-template')

@section('title', '| Log New Fault')

@section('content')
<h3><i class='fa fa-file-text'></i> Add New Fault</h3>
    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading"><h5><i class='fa fa-check-circle-o'></i> Create new fault log here</h5></div>
                <div class="panel-body">
					
					{{-- Show errrors for input fields. --}}
					@include('errors.list')
					
					{{-- Using the Laravel HTML Form Collective to create our form --}}
					{{ Form::open(array('route'=>'faults.store', 'files'=>true)) }}
					
					<div class="from-group row">
						<div class="col-xs-4">
							{{ Form::label('service_id', 'Service No.:') }}
							{{ Form::select('service_id', $service_numbers, null, ['placeholder' => '--Service Number--', 'class' => 'form-control']) }}
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
							<label for="building_id">Building:</label>
							<select name="building_id" id="building_id" class="form-control">
								<option>--Building--</option>
							</select>
						</div>
						<div class="col-xs-6">
							<label for="location_id">Location:</label>
							<select name="location_id" id="location_id" class="form-control">
								<option>--Location--</option>
							</select>
						</div>
					</div>
					<br>
					<div class="from-group row">
						<div class="col-xs-8">
							<label for="machine_id">Machine No.:</label>
							<select name="machine_id" id="machine_id" class="form-control">
								<option>--Machine Number--</option>
							</select>						</div>
						<div class="col-xs-4">
							{{ Form::label('status', 'Fault Closed?') }}
							<select name="status" class="form-control" id="status">
								<option value="" disabled selected hidden>Work Complete...</option>
								<option value="Yes" @if (old('status') == "Yes") {{ 'selected' }} @endif>Yes</option>
								<option value="No" @if (old('status') == "No") {{ 'selected' }} @endif>No</option>
							</select>
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
					<div class="input-group">
						{{ Form::label('images', 'You can add multiple images:') }} <br>
						{{ Form::file('images[]', array('id'=>'images', 'multiple'=>true)) }} <br>
					</div>

					<div class="from-group">
						{{ Form::button('<i class="fa fa-plus-circle"> Add fault</i>', ['type' => 'submit', 'class' => 'btn btn-success btn-sm pull-right']) }}
						<a href="{{ route('faults.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>
				</div>
			</div>
		</div>
	</div>	
	
@endsection