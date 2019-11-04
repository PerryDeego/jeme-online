{{-- resources/views/installations/index.blade.php --}}

@extends('layouts.app-template')

@section('title', '| Intstallations Listing')

@section('content')
    <div class="col-sm-12 col-sm">
        <h1><i class="fa fa-th"></i> Installation Jobs Administration 
            <a href="{{ route('roles.index') }}" class="btn btn-default pull-right">Roles</a>
            <a href="{{ route('permissions.index') }}" class="btn btn-default pull-right">Permissions</a>
        </h1>

        {{-- fiter search box --}}
        @include('search.filter-search')
        
        <small>Page {{ $installations->currentPage() }} of {{ $installations->lastPage() }}</small>
        <div class="table-responsive-xs">
            <table class="table table-striped table-xs" data-toggle="dataTable" data-form="deleteConfirm">
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
                    @foreach ($installations as $installation)
                    <tr>
						<td>{{ $installation->job_number }}</td>
						<td>{{ $installation->contract_number }}</td>
                        <td>{{ $installation->name }}</td>
						<td>{{ $installation->erector }}</td>
						<td><span class="label label-success">{{ $installation->status }}</span></td>
						<td>{{ $installation->location }}</td>
						<td><i class="fa fa-calendar"> {{ $installation->start_date }}</i></td>
						<td><i class="fa fa-calendar"> {{ $installation->end_date }}</i></td>
						<td>{{ $installation->created_at }}</td>
                        <td>
                            <div class="row">
                                <div class="col-sm-4">
                                    <a href="{{ route('installations.edit', $installation->id) }}" class="btn btn-info  btn-xs"><small><i class="fa fa-pencil"> Edit</i></small></a>
                                </div>
                                <div class="col-sm-4">
                                    {!! Form::model($installation, ['method' => 'DELETE', 'route' => ['installations.destroy', $installation->id], 'class' =>'form-inline form-delete']) !!}
                                    {!! Form::hidden('id', $installation->id) !!}
                                    {{ Form::button('<small><i class="fa fa-trash"> Delete</i></small>', ['type' => 'submit', 'class' => 'btn btn-xs btn-danger delete', 'name' => 'delete_modal'] ) }}
                                    {!! Form::close() !!}
                                </div>
                            </div>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
			
            {{-- pagination --}}
            {{ $installations->render() }}
			
        </div>
        <div class="row">
            <div class="col-sm-6">
                <br>
                <a href="{{ route('installations.create') }}" class="btn btn-primary  btn-sm"><i class="fa fa-plus-circle"> Add New Job</i></a><br>
            </div>
        </div>
    </div>
@endsection
