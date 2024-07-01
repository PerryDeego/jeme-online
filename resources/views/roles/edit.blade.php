@extends('layouts.app-template')

@section('title', '| Edit Role')

@section('content')
	<h4><i class='fa fa-lock'></i> Edit Role - {{ $role->name }}</h4>
	<div class="row">
		<div class="col-xs-12">
			<div class="panel panel-default">
				<div class="panel-heading"><h5><i class='fa fa-edit'></i> Edit Role Here</h5></div>
				<div class="panel-body">
				   
					{{-- Show errrors for input fields. --}}
                    @include('errors.list')
                    
                    {{-- Using the Laravel HTML Form Collective to create our form --}}
					{{ Form::model($role, array('route' => array('roles.update', $role->id), 'method' => 'PUT')) }}

					<div class="form-group">
						{{ Form::label('name', 'Role Name:') }}
						{{ Form::text('name', null, array('class' => 'form-control')) }}
					</div>
					<div class="form-group">
						<h5><b>Assign Permissions:</b></h5>
						<small>
							@foreach ($permissions as $permission)
								{{Form::checkbox('permissions[]',  $permission->id, $role->permissions ) }}
								{{Form::label($permission->name, ucfirst($permission->name)) }}
							@endforeach
						</small>
					</div>
					<br>
					<div class="from-group">
						{{ Form::button('<i class="fa fa-edit"> Edit Role</i>', ['type' => 'submit', 'class' => 'btn btn-warning btn-sm pull-right']) }}
						<a href="{{ route('roles.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>				
				</div>
			</div>
		</div>
	</div>
@endsection