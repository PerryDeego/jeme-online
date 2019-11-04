{{-- \resources\views\permissions\index.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Permissions')

@section('content')
<div class="row">	
	<div class="col-xs-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3><i class="fa fa-key"></i> Available Permissions
					<a href="{{ URL::to('permissions/create') }}" class="btn btn-primary btn-sm pull-right"><i class="fa fa-plus"> Add Permission</i></a>
				<a href="{{ route('users.index') }}" class="btn btn-default btn-sm pull-right">Users</a>
				<a href="{{ route('roles.index') }}" class="btn btn-default btn-sm pull-right">Roles</a></h3>
				(Only users associated with the Admin Permission can access this page) 
			</div>
			
			<div class="panel-body">
				<div class="table-responsive-xs">
					<table class="table table-hover table-xs" data-toggle="dataTable" data-form="deleteConfirm" id="tbl-list">
						<thead>
							<tr>
								<th>Permissions</th>
								<th>Created By</th>
								<th>Modified By</th>
								<th>Actions</th>
							</tr>
						</thead>
						<tbody>
							@foreach ($permissions as $permission)
							<tr>
								<td>{{ $permission->name }}</td> 
								<td>{{ $permission->created_by }}</td>
								<td>{{ $permission->modified_by }}</td>
								<td>
									<div class="row">
										<div class="col-xs-1">
												<a href="{{ URL::to('permissions/'.$permission->id.'/edit') }}" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i></a>
										</div>
										<div class="col-xs-1">
											{!! Form::model($permission, ['method' => 'DELETE', 'route' => ['permissions.destroy', $permission->id], 'class' =>'form-inline form-delete']) !!}
											{!! Form::hidden('id', $permission->id) !!}
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