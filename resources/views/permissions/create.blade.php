{{-- \resources\views\permissions\create.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Create Permission')

@section('content')
	<h4><i class='fa fa-key'></i> Add New Permission</h4>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">
				<div class="panel-heading"><h5><i class='fa fa-check-circle-o'></i> Create Permission Here</h5></div>
				<div class="panel-body">

					{{-- Show errrors for input fields. --}}
					@include('errors.list')

					{{ Form::open(array('url' => 'permissions')) }}

					<div class="form-group">
						{{ Form::label('name', 'Name') }}
						{{ Form::text('name', '', array('class' => 'form-control')) }}
					</div>
					<div class="form-group">
						@if(!$roles->isEmpty()) {{-- If no roles exist yet --}}
							<h5><b>Assign Permission to Roles:</b></h5>
							<small>
								@foreach ($roles as $role) 
									{{ Form::checkbox('roles[]',  $role->id ) }}
									{{ Form::label($role->name, ucfirst($role->name)) }}
								@endforeach
							</small>
						@endif
					</div>
					<br>
					<div class="from-group">
						{{ Form::button('<i class="fa fa-plus-circle"> Add Permission</i>', ['type' => 'submit', 'class' => 'btn btn-success btn-sm pull-right']) }}
						<a href="{{ route('permissions.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>				
				</div>
			</div>
		</div>
	</div>
@endsection