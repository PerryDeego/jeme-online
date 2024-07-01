@extends('layouts.app-template')

@section('title', '| Edit Permission')

@section('content')
	
	<h4><i class='fa fa-key'></i> Edit Permission - {{ $permission->name }}</h4>
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-default">
				<div class="panel-heading"><h5><i class='fa fa-edit'></i> Edit Permission Here</h5></div>
				<div class="panel-body">

					{{-- Show errrors for input fields. --}}
					@include('errors.list')

					{{ Form::model($permission, array('route' => array('permissions.update', $permission->id), 'method' => 'PUT')) }}{{-- Form model binding to automatically populate our fields with permission data --}}

					<div class="form-group">
						{{ Form::label('name', 'Permission Name:') }}
						{{ Form::text('name', null, array('class' => 'form-control')) }}
					</div>
					<br>
					<div class="from-group">
						{{ Form::button('<i class="fa fa-edit"> Edit Permission</i>', ['type' => 'submit', 'class' => 'btn btn-warning btn-sm pull-right']) }}
						<a href="{{ route('permissions.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>
				</div>
			</div>
		</div>
	</div>
	
@endsection