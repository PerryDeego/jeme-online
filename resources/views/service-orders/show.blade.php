{{-- \resources\views\service-orders\show.blade.php --}}

@extends('layouts.app-template')

@section('title', '| Create New Service Jobs')

@section('content')

	<h2><i class='fa fa-wrench'></i> <strong>Details for Order Number : {{ $service_order->order_no }}</strong></h2>
	<div class="row">
	<div class="col-xs-12">
		<div class="panel panel-default">
			<div class="panel-heading">	
				<table class="table table-condensed table-xs" style="color: blue">
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
			<div class="panel-body" style="background-color: pink;">

				{{-- Show errrors for input fields. --}}
				@include('errors.list')

				<h5><i class='fa fa-list'></i><b> Service Order</b> property details.</h5>
				<hr>
				
				<div class="from-group row">
					<div class="col-xs-4">
						{{ Form::label('order_no', 'Order No.') }}
						{{ Form::text('order_no', $service_order->order_no, array('class' => 'form-control')) }}
					</div>
					<div class="col-xs-4">
						{{ Form::label('service_no', 'Service No') }}
						{{ Form::text('order_no', $service_order->Service()->pluck('service_no')->implode(''), array('class' => 'form-control')) }}
					</div>
					<div class="col-xs-4">
						{{ Form::label('service_date', 'Date') }}
						<div class="input-group margin-bottom-xs">
							<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
							{!! Form::text('date', $service_order->date , array('class' => 'form-control') ) !!}
						</div>
					</div>
				</div>
				<br>
				<div class="from-group row">
					<div class="col-xs-12">
						{{ Form::label('charge_to', 'Charge To') }}
						{{ Form::text('charge_to', $service_order->charge_to, array('class' => 'form-control')) }}
					</div>
				</div>
				<br>
				<div class="from-group row">
					<div class="col-xs-12">
						{{ Form::label('address', 'Address') }}
						{{ Form::text('address', $service_order->address, array('class' => 'form-control')) }}
					</div>
				</div>
				<br>
				<div class="from-group row">
					<div class="col-xs-6">
						{{ Form::label('name', 'Building Name') }}
						{{ Form::text('name', $service_order->Building()->pluck('name')->implode(' '), array('class' => 'form-control')) }}
					</div>
					<div class="col-xs-6">
						{!! Form::label('location_id', 'Location') !!}
						{{ Form::text('address', $service_order->Location()->pluck('name')->implode(' '), array('class' => 'form-control')) }}
					</div>
				</div>
				<br>
				<div class="from-group row">
					<div class="col-xs-4">
						{{ Form::label('machine_id', 'Machine No') }}
						{{ Form::text('address', $service_order->Machine()->pluck('machine_no')->implode(''), array('class' => 'form-control')) }}
					</div>
					<div class="col-xs-3">
						{{ Form::label('order_type', 'Order Type') }}
						{{ Form::text('order_type', $service_order->order_type, array('class' => 'form-control')) }}
					</div>
				</div>
				<br><hr>

				<div class="from-group row">
					<div class="col-xs-4">
							{{ Form::label('taken_by', 'Order Taken By') }}
							{{ Form::text('taken_by', $service_order->taken_by, array('class' => 'form-control')) }}
						</div>
					<div class="col-xs-4">
						{{ Form::label('customer', 'Customer') }}
						{{ Form::text('customer', $service_order->customer, array('class' => 'form-control')) }}
					</div>
					<div class="col-xs-2">
						{{ Form::label('no_of_person', 'No Of Person') }}
						{{ Form::text('no_of_person', $service_order->no_of_person, array('class' => 'form-control')) }}
					</div>
					<div class="col-xs-2">
						{{ Form::label('status', 'Work Complete?') }}
						{{ Form::text('address', $service_order->status, array('class' => 'form-control')) }}
					</div>
				</div>
				<br>
				<div class="from-group row">
					<div class="col-xs-12">
						{{ Form::label('work_description', 'Workdone') }}
						{!! Form::textarea('work_description', $service_order->work_description, ['class'=>'form-control', 'rows' => 8]) !!}
					</div>
				</div>
				<br>
				<div class="from-group row">
					<div class="col-xs-2">
						<br><a href="{{ route('service-orders.index') }}" class="btn btn-default btn-sm btn-block"><i class="fa fa-backward"></i> Back</a>
						{{ Form::close() }}
					</div>
				</div>
				<br>				
			</div>
		</div>
	</div>	
	
</div>
@endsection