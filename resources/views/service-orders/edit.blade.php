{{-- \resources\views\service-orders\edit.blade.php --}}

@extends('layouts.app-template')

@section('title', '| Create New Service Jobs')

@section('content')

	<h2><i class='fa fa-wrench'></i> Edit Service Order</h2>
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

				<h5><i class='fa fa-edit'></i> Edit <b>Service Order</b> property details here.</h5>
				<hr>
				
				{{-- Using the Laravel HTML Form Collective to create our form --}}
				{{ Form::model($service_order, array('route' => array('service-orders.update', $service_order->id), 'method' => 'PUT')) }}
				<div class="from-group row">
					<div class="col-xs-4">
						{{ Form::label('order_no', 'Order No.:') }}
						{{ Form::text('order_no', null, array('class' => 'form-control')) }}
					</div>
					<div class="col-xs-4">
						{{ Form::label('service_id', 'Service .:') }}
						{{ Form::select('service_id', $service_numbers, null, ['class' => 'form-control']) }}
					</div>
					<div class="col-xs-4">
						{{ Form::label('date', 'Date') }}
						<div class="input-group margin-bottom-xs">
							<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
							{{ Form::date('date', $service_order->date, array('class' => 'form-control') ) }}
						</div>
					</div>
				</div>
				<br>
				<div class="from-group row">
					<div class="col-xs-12">
						{{ Form::label('charge_to', 'Charge To:') }}
						{{ Form::text('charge_to', null, array('class' => 'form-control')) }}
					</div>
				</div>
				<br>
				<div class="from-group row">
					<div class="col-xs-12">
						{{ Form::label('address', 'Address:') }}
						{{ Form::text('address', null, array('class' => 'form-control')) }}
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
					<div class="col-xs-4">
						{{ Form::label('machine_id', 'Machine No.:') }}
						{{ Form::select('machine_id', $machine_numbers, null, ['class' => 'form-control']) }}
					</div>
					<div class="col-xs-3">
						{{ Form::label('order_type', 'Order Type:') }}
						<select name="order_type" class="form-control" id="order_type">
							<option value="FML EXAM">FML EXAM</option>
							<option value="OG EXAM">OG EXAM</option>
							<option value="FM EXAM">FM EXAM</option>
							<option value="CALL BACK">CALL BACK</option>
							<option value="REPAIR">REPAIR</option>
							<option value="EXTRA EXAM">EXTRA EXAM</option>
							<option value="ROPES">ROPES</option>
						</select>
					</div>
				</div>
				<br><br>
				<button class="btn btn-block" disabled>[Ensure all information is entered correctly]</button>
				<br><br>
				<div class="from-group row">
					<div class="col-xs-4">
							{{ Form::label('taken_by', 'Order Taken By') }}
							{{ Form::text('taken_by', null, array('placeholder' => 'Order Taken By', 'class' => 'form-control')) }}
						</div>
					<div class="col-xs-4">
						{{ Form::label('customer', 'Customer') }}
						{{ Form::text('customer', null, array('class' => 'form-control')) }}
					</div>
					<div class="col-xs-2">
						{{ Form::label('no_of_person', 'No Of Person') }}
						{{ Form::number('no_of_person', null, array('class' => 'form-control')) }}
					</div>
					<div class="col-xs-2">
						{{ Form::label('status', 'Work Complete?') }}
						{{ Form::select('status', [ 'Yes' => 'Yes', 'No' => 'No'], $service_order->status, ['class' => 'form-control']) }}
					</div>
				</div>
				<br>
				<div class="from-group row">
					<div class="col-xs-12">
						{{ Form::label('work_description', 'Workdone:') }}
						{!! Form::textarea('work_description', null, ['class'=>'form-control', 'rows' => 8]) !!}
					</div>
				</div>
				<br>
				<div class="from-group">
					{{ Form::button('<i class="fa fa-edit"> Edit Order</i>', ['type' => 'submit', 'class' => 'btn btn-warning btn-sm pull-right']) }}
					<a href="{{ route('service-orders.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
					{{ Form::close() }}
				</div>				
			</div>
		</div>
	</div>	
	
</div>
@endsection