@extends('layouts.app-template')

@section('content')
  
<!-- Main content -->
<div class="panel panel-default">
    <div class="panel-heading">
	<!-- Dashboard top-layer Content -->
		<!-- top tiles -->
		<div class="row tile_count" style="font-size: x-medium;">
			<div class="col-sm-3 col-sm-3 col-sm-12 col-xs-12">
				<div class="info-box blue-bg bg-red" style="text-align: center;border-radius: 5px;">
					<i class="fa fa-gears"></i>
					<div class="count">
						{{ $current_month_orders }}
					</div>
					<div class="title">This Month Service Orders</div>
				</div><!--/.info-box-->
			</div><!--/.col-->

			<div class="col-sm-3 col-sm-3 col-sm-12 col-xs-12">
				<div class="info-box blue-bg bg-blue" style="text-align: center;border-radius: 5px;">
					<i class="fa fa-list-alt"></i>
					<div class="count">{{ $count_faults }}</div>
					<div class="title">Total Reported Faults</div>
				</div><!--/.info-box-->
			</div><!--/.col-->

			<div class="col-sm-3 col-sm-3 col-sm-12 col-xs-12">
				<div class="info-box dark-bg bg-red" style="text-align: center;border-radius: 5px;">
					<i class="fa fa-thumbs-o-up"></i>
					<div class="count">{{ $count_orders }}</div>
					<div class="title">Total No. of Service Orders</div>
				</div><!--/.info-box-->
			</div><!--/.col-->
			<div class="col-sm-3 col-sm-3 col-sm-12 col-xs-12">
				<div class="info-box blue-bg bg-blue" style="text-align: center;border-radius: 5px;">
					<i class="fa fa-stack-overflow"></i>
					<div class="count">50</div>
					<div class="title">Total No. of Contract</div>
				</div><!--/.info-box-->
			</div><!--/.col-->
		</div>
		<!-- /top tiles -->
	<!-- /.content top-layer content-->
	</div>
			
      <div class="panel-body">
        <h5> <i class="fa fa-exchange"></i> Roles & Permissions Administration <a href="{{ route('roles.index') }}" class="btn btn-default btn-sm pull-right">Roles</a>
        	<a href="{{ route('permissions.index') }}" class="btn btn-default btn-sm pull-right">Permissions</a></h5>
          <hr>
          <h5> <i class="fa fa-users"></i> Users Administration <a href="{{ route('users.create') }}" class="btn btn-default btn-sm pull-right">Add</a>
            <a href="{{ route('users.index') }}" class="btn btn-default btn-sm pull-right">View</a></h5>
		  <hr>
		  <h5> <i class="fa fa-th"></i> Callendar Events Administration <a href="{{ route('events.create') }}" class="btn btn-default btn-sm pull-right">Add</a>
            <a href="{{ route('events.index') }}" class="btn btn-default btn-sm pull-right">View</a></h5>
		  <hr>
		  <h5> <i class="fa fa-th"></i> Building Names Administration <a href="{{ route('buildings.create') }}" class="btn btn-default btn-sm pull-right">Add</a>
            <a href="{{ route('buildings.index') }}" class="btn btn-default btn-sm pull-right">View</a></h5>
		  <hr>
		  <h5> <i class="fa fa-th"></i> Service Numbers Administration <a href="{{ route('service-numbers.create') }}" class="btn btn-default btn-sm pull-right">Add</a>
            <a href="{{ route('service-numbers.index') }}" class="btn btn-default btn-sm pull-right">View</a></h5>
		  <hr>
		  <h5> <i class="fa fa-th"></i> Location Names Administration <a href="{{ route('locations.create') }}" class="btn btn-default btn-sm pull-right">Add</a>
			<a href="{{ route('locations.index') }}" class="btn btn-default btn-sm pull-right">View</a>
		   </h5>
          <hr>
          <h5> <i class="fa fa-th"></i> Service Orders Administration <a href="{{ route('service-orders.create') }}" class="btn btn-default btn-sm pull-right">Add</a>
            <a href="{{ route('service-orders.index') }}" class="btn btn-default btn-sm pull-right">View</a></h5>
          <hr>
          <h5> <i class="fa  fa-trello"></i> Installation Jobs Administration <a href="{{ route('installations.create') }}" class="btn btn-default btn-sm pull-right">Add</a>
            <a href="{{ route('installations.index') }}" class="btn btn-default btn-sm pull-right">View</a></h5>
      </div>
    </div>

  	<div class="x_panel">
		<div class="x_content">	
			<h2><b>Job Schedules<small> & Reminders</small></b></h2>
			<div class="panel panel-primary">
				<div class="panel-heading">MY Event Details</div>
				<div class="panel-body" >
						<ul class="nav navbar-right panel_toolbox">
								<li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
								</li>
								<li><a class="close-link"><i class="fa fa-close"></i></a>
								</li>
							</ul>
					{!! $calendar_details->calendar() !!}
					{!! $calendar_details->script() !!}
				</div>
			</div>
		</div>
	</div>

<!-- /.content -->
@endsection

