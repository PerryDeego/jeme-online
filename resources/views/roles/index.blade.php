{{-- \resources\views\roles\index.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Roles')

@section('content')
<div class="row">
	<div class="col-xs-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3><i class="fa fa-lock"></i> Roles Administration
					<a href="{{ URL::to('roles/create') }}" class="btn btn-primary btn-sm pull-right"><i class="fa fa-plus"> Add Role</i></a>
				<a href="{{ route('users.index') }}" class="btn btn-default btn-sm pull-right">Users</a>
				<a href="{{ route('permissions.index') }}" class="btn btn-default btn-sm pull-right">Permissions</a></h3>
				(Only users associated with the Admin Role can access this page) 
			</div>
			
			<div class="panel-body">
				<div class="table-responsive-xs">
						<table class="table table-hover table-xs" data-toggle="dataTable" data-form="deleteConfirm" id="tbl-list">
						<thead>
							<tr>
								<th>Role</th>
								<th>Permissions</th>
								<th>Modified By</th>
								<th>Actions</th>
							</tr>
						</thead>

						<tbody>
							@foreach ($roles as $role)
							<tr>

								<td>{{ $role->name }}</td>
								<td>{{ str_replace(array('[',']','"'),'', $role->permissions()->pluck('name')) }}</td>{{-- Retrieve array of permissions associated to a role and convert to string --}}
								<td>{{ $role->modified_by }}</td>
								<td>
									<div class="row">
										<div class="col-xs-1">
												<a href="{{ URL::to('roles/'.$role->id.'/edit') }}" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i></a>
										</div>
										<div class="col-xs-1">
												{!! Form::model($role, ['method' => 'DELETE', 'route' => ['roles.destroy', $role->id], 'class' =>'form-inline form-delete']) !!}
												{!! Form::hidden('id', $role->id) !!}
												{{ Form::button('<i class="fa fa-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-xs btn-danger delete', 'name' => 'delete_modal'] ) }}
												{!! Form::close() !!}
										</div>
									</div>
								</td>
							</tr>
							@endforeach
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection