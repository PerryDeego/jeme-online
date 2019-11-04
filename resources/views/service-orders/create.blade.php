{{-- \resources\views\service-orders\create.blade.php --}}

@extends('layouts.app-template')

@section('title', '| Create New Service Jobs')

@section('content')

	<h2><i class="fa fa-file"></i> Add New Service Order</h2>
	<div class="row">
	<div class="col-xs-12">
		<div class="panel panel-default" style="color: blue">
			<div class="panel-heading">	
				<table class="table table-condensed table-xs">
						<tbody style="color: blue">
							<tr>
								<td class="display-1" rowspan="0">
									<img src="{{ URL::to('/dist/img/otis_united.png') }}" style="height: 100px; width: 250px; border-radius: 15px;">
								</td>
							</tr>
							<tr class="text-right">
								<td>JAMAICA ELECTRICAL & MECHANICAL ENGINEERS LTD.</td>
							</tr>
							<tr class="text-right">
								<td>2 Ivy Green Cres, Kingston 5, Phone: (876) 926-2092,926-2093, 926-4149 Fax: (876) 968-08896 </td>
							</tr>
							<tr class="text-right">
								<td style="font-size:20px !important; font-weight: bold;">ORDER AND CERTIFICATE OF TIME</td>
							</tr>
						</tbody>
					</table>
			</div>
			<div class="panel-body">

				{{-- Show errrors for input fields. --}}
				@include('errors.list')

				<h5><i class='fa fa-check-circle-o'></i> Please fill out <b>Service Order</b> property details.</h5>
				<hr>
				
				{{-- Using the Laravel HTML Form Collective to create our form --}}
				{{ Form::open(array('route' => 'service-orders.store')) }}
				<div class="from-group row">
					<div class="col-xs-4">
						{{ Form::label('order_no', 'Order No.:') }}
						{{ Form::number('order_no', null, array('placeholder' => 'Order Number' , 'class' => 'form-control')) }}
					</div>
					<div class="col-xs-4">
						{{ Form::label('service_id', 'Service No.:') }}
                		{{ Form::select('service_id', $service_numbers, null, ['placeholder' => '--Select service number--', 'class' => 'form-control']) }}
					</div>
					<div class="col-xs-4">
						{{ Form::label('date', 'Date:') }}
						<div class="input-group margin-bottom-xs">
							<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
							{!! Form::text ('date', null, ['class' => 'form-control', 'placeholder'=>'Date picker...']) !!}
						</div>
					</div>
				</div>
				<br>
				<div class="from-group row">
					<div class="col-xs-12">
						{{ Form::label('charge_to', 'Charge To:') }}
						{{ Form::text('charge_to', null, array('placeholder' => 'Charge To' , 'class' => 'form-control')) }}
					</div>
				</div>
				<br>
				<div class="from-group row">
					<div class="col-xs-12">
						{{ Form::label('address', 'Address:') }}
						{{ Form::text('address', null, array('placeholder' => 'Address', 'class' => 'form-control')) }}
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
					<div class="col-xs-6">
						<label for="machine_id">Machine No:</label>
						<select name="machine_id" id="machine_id" class="form-control">
								<option>--Machine Number--</option>
						</select>
					</div>
					<div class="col-xs-6">
						{{ Form::label('order_type', 'Order Type:') }}
						<select name="order_type" class="form-control" id="order_type_id">
							<option value="" disabled selected hidden>Order Type...</option>
							<option value="FML EXAM" @if (old('order_type') == "FML EXAM") {{ 'selected' }} @endif>FML EXAM</option>
							<option value="OG EXAM" @if (old('order_type') == "OG EXAM") {{ 'selected' }} @endif>OG EXAM</option>
							<option value="FM EXAM" @if (old('order_type') == "FM EXAM") {{ 'selected' }} @endif>FM EXAM</option>
							<option value="CALL BACK" @if (old('order_type') == "CALL BACK") {{ 'selected' }} @endif>CALL BACK</option>
							<option value="REPAIR" @if (old('order_type') == "REPAIR") {{ 'selected' }} @endif>REPAIR</option>
							<option value="EXTRA EXAM" @if (old('order_type') == "EXTRA EXAM") {{ 'selected' }} @endif>EXTRA EXAM</option>
							<option value="ROPES" @if (old('order_type') == "ROPES") {{ 'selected' }} @endif>ROPES</option>
						</select>
					</div>
				</div>
				<br><br>
				<button class="btn btn-block" disabled>[Ensure all information is entered correctly]</button>
				<br><br>
				<div class="from-group row">
					<div class="col-xs-4">
							{{ Form::label('taken_by', 'Order Taken By:') }}
							{{ Form::text('taken_by', null, array('placeholder' => 'Order Taken By', 'class' => 'form-control')) }}
						</div>
					<div class="col-xs-4">
						{{ Form::label('customer', 'Customer:') }}
						{{ Form::text('customer', null, array('placeholder' => 'Customer Name' , 'class' => 'form-control')) }}
					</div>
					<div class="col-xs-2">
						{{ Form::label('no_of_person', 'No Of Person:') }}
						{{ Form::number('no_of_person', null, array('placeholder' => 'Persons', 'class' => 'form-control')) }}
					</div>
					<div class="col-xs-2">
						{{ Form::label('status', 'Work Complete?') }}
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
						{{ Form::label('work_description', 'Workdone:') }}
						{!! Form::textarea('work_description', null, ['placeholder' => 'Add work description here.', 'class'=>'form-control', 'rows' => 8]) !!}
					</div>
				</div>
				<br>
				<div class="from-group">
					{{ Form::button('<i class="fa fa-plus-circle"> Add Order</i>', ['type' => 'submit', 'class' => 'btn btn-success btn-sm pull-right']) }}
					<a href="{{ route('service-orders.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
					{{ Form::close() }}
				</div>				
			</div>
		</div>
	</div>	
</div>	



@endsection