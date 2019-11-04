{{-- \resources\views\buildings\index.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Building List')

@section('content')
<div class="row">
    <div class="col-xs-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3><i class="fa fa-building"></i> Building List
                    <a href="{{ route('buildings.create') }}" class="btn btn-primary  btn-sm pull-right"><i class="fa fa-plus"> Add building</i></a>
                    <a href="{{ route('locations.index') }}" class="btn btn-default btn-sm pull-right">Locations</a>
                    <a href="{{ route('service-numbers.index') }}" class="btn btn-default btn-sm pull-right">Service Nos.</a>
                </h3>
                (Only users associated with the Admin Roles & Permissions have privilege to modifiy contents) 
            </div>
            
            <div class="panel-body">
                <div class="table-responsive-xs">
                    <table class="table table-hover table-xs" data-toggle="dataTable" data-form="deleteConfirm" id="tbl-list">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Service No.</th>
                                <th>Location</th>
                                <th>Created By</th>
                                <th>Modified By</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($buildings as $building)
                            <tr>
                                <td>{{ $building->name }}</td>
                                <td>{{ $building->Service()->pluck('service_no')->implode(' ') }}</td>	{{-- Retrieve ServiceNumber associated to a Building and convert to string --}}
                                <td>{{ $building->Location()->pluck('name')->implode(' ') }}</td>	{{-- Retrieve Location associated to a Building and convert to string --}}
                                <td>{{ $building->User()->pluck('name')->implode(' ') }}</td>	{{-- Retrieve User associated to a Building and convert to string --}}
                                <td>{{ $building->modified_by }}</td>
                                <td>
                                    <div class="row">
                                        <div class="col-xs-1">
                                            <a href="{{ route('buildings.edit', $building->id) }}" class="btn btn-info  btn-xs"><i class="fa fa-pencil"></i></a>
                                        </div>
                                        <div class="col-xs-1">                                
                                            {!! Form::model($building, ['method' => 'DELETE', 'route' => ['buildings.destroy', $building->id], 'class' =>'form-inline form-delete']) !!}
                                            {!! Form::hidden('id', $building->id) !!}
                                            {{ Form::button('<i class="fa fa-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-xs btn-danger delete', 'name' => 'delete_modal'] ) }}
                                            {!! Form::close() !!}									
                                        </div>
                                        <div class="col-xs-1">
                                            <a href="{{ route('buildings.show', $building->id) }}" class="btn btn-default  btn-xs"><i class="fa fa-eye"></i></a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    
                    <div class="form-group">
                        <div class="col-xs-6">
                            <small>{{ $buildings->render() }}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

