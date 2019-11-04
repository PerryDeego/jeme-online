@extends('layouts.app-template')

@section('title', '| View Sevice Jobs')

@section('content')

	<div class="container">

		<h1><i class="fa fa-th"></i> Service Jobs Administration <a href="{{ route('roles.index') }}" class="btn btn-default pull-right">Roles</a>
		<a href="{{ route('permissions.index') }}" class="btn btn-default pull-right">Permissions</a></h1>
		<hr>
		<div class="table-responsive">
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
						<th>Job No.</th>
						<th>Contract No.</th>
						<th>Name</th>
						<th>Erector</th>
						<th>Status</th>
						<th>Location</th>
						<th>Start_Date</th>
						<th>End_Date</th>
						<th>Created At</th>
						<th>Actions</th>
					</tr>
				</thead>
				
				<tbody>
					<tr>
						<td>{{ $installation->job_number }}</td>
						<td>{{ $installation->contract_number }}</td>
						<td>{{ $installation->name }}</td>
						<td>{{ $installation>erector }}</td>
						<td>{{ $installation->status }}</td>
						<td>{{ $installation->location }}</td>
						<td>{{ $installation->start_date }}</td>
						<td>{{ $installation->end_date }}</td>
						<td>{{ $installation->created_at }}</td>
						<td>
							<div class="row">
								<div class="col-sm-4">
									<a href="{{ url()->previous() }}" class="btn btn-primary">Back</a>
								</div>
								<div class="col-sm-4">             
								{!! Form::open(['method' => 'DELETE', 'route' => ['installations.destroy', $job->id] ]) !!}
								
								@can('Edit job')
								<a href="{{ route('installations.edit', $job->id) }}" class="btn btn-info" role="button">Edit</a>
								@endcan
								@can('Delete job')
								{!! Form::submit('Delete', ['class' => 'btn btn-danger']) !!}
								@endcan
								{!! Form::close() !!}
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
    
@endsection