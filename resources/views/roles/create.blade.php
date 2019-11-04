{{-- \resources\views\roles\create.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Add Role')

@section('content')
    <h4><i class='fa fa-lock'></i> Add Roles</h4>
    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
				<div class="panel-heading"><h5><i class='fa fa-check-circle-o'></i> Create new role here</h5></div>
                <div class="panel-body">
				   
					{{-- Show errrors for input fields. --}}
                    @include('errors.list')
                    
                    {{-- Using the Laravel HTML Form Collective to create our form --}}
					{{ Form::open(array('url' => 'roles')) }}

					<div class="form-group">
						{{ Form::label('name', 'Name:') }}
						{{ Form::text('name', null, array('class' => 'form-control')) }}
					</div>
					<div class='form-group'>
						<h5><b>Assign Permissions:</b></h5>
						<small>
							@foreach ($permissions as $permission)
								{{ Form::checkbox('permissions[]',  $permission->id ) }}
								{{ Form::label($permission->name, ucfirst($permission->name)) }}
							@endforeach
						</small>
					</div>
					<br>
					<div class="from-group">
						{{ Form::button('<i class="fa fa-plus-circle"> Add Role</i>', ['type' => 'submit', 'class' => 'btn btn-success btn-sm pull-right']) }}
						<a href="{{ route('roles.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
						{{ Form::close() }}
					</div>				
				</div>
			</div>
		</div>
	</div>
@endsection