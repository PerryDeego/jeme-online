{{-- resources/views/faults/index.blade.php --}}

@extends('layouts.app-template')

@section('title', '| Faults Listing')

@section('content')
<div class="row">	
	<div class="col-xs-12">
		<div class="panel panel-default">
			<div class="panel-heading">
                <h3>
                    <i class="fa fa-th"></i> Fault Logging List
                    <a href="{{ route('faults.create') }}" class="btn btn-primary btn-sm pull-right"><i class="fa fa-plus"> Add Fault</i></a>
                </h3>
				(Only users associated with the Admin Permission can access this page) 
			</div>
			
			<div class="panel-body">
                <div class="table-responsive-xs">
                    <table class="table table-hover table-xs" data-toggle="dataTable" data-form="deleteConfirm" id="tbl-list">
                        <thead>
                            <tr>
                                <th>Service No.</th>
                                <th>Machine No.</th>
                                <th>Building Name</th>
                                <th>Location</th>
                                <th>Status</th>
                                <th>Logged_by</th>
                                <th>Logged At</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            @foreach ($faults as $fault)
                            <tr>
                                <td>{{ $fault->Service()->pluck('service_no')->implode(' ') }}</td>
                                <td>{{ $fault->Machine()->pluck('machine_no')->implode(' ') }}</td>
                                <td>{{ $fault->Building()->pluck('name')->implode(' ') }}</td>
                                <td>{{ $fault->Location()->pluck('name')->implode(' ') }}</td>
                                <td><span class="label label-success">{{ $fault->status }}</span></td>
                                <td>{{ $fault->User()->pluck('name')->implode(' ') }}</td>	{{-- Retrieve User associated to a Building Name and convert to string --}}
                                <td>{{ $fault->created_at }}</td>
                                <td>
                                    <div class="row">
                                        <div class="col-xs-1">
                                            <a href="{{ route('faults.edit', $fault->id) }}" class="btn btn-info  btn-xs"><i class="fa fa-pencil"></i></a>
                                        </div>
                                        <div class="col-xs-1">
                                            {!! Form::open(['method' => 'DELETE', 'route' => ['faults.destroy', $fault->id] ]) !!}        
                                            {{ Form::button('<i class="fa fa-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-xs'] )  }}
                                            {!! Form::close() !!}
                                        </div>
                                        <div class="col-xs-1">
                                            <a href="{{ route('faults.show', $fault->id) }}" class="btn btn-default  btn-xs"><i class="fa fa-eye"></i></a>
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
