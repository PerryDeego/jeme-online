{{-- \resources\views\locations\index.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Location List')

@section('content')

<div class="row">
    <div class="col-xs-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>
                    <i class="fa fa-list"></i> Location List
                    <a href="{{ route('locations.create') }}" class="btn btn-primary btn-sm pull-right"><i class="fa fa-plus"> Add New location</i></a>
                </h3>
                (Only users associated with the Admin Roles & Permissions have privilege to modifiy contents) 
            </div>
            
            <div class="panel-body">
                <div class="table-responsive-xs">
                    <table class="table table-hover table-xs" data-toggle="dataTable" data-form="deleteConfirm" id="tbl-list">
                        <thead>
                            <tr>
                                <th>Location</th>
                                <th>Created By</th>
                                <th>Modified By</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($locations as $location)
                            <tr>
                                <td>{{ $location->name }}</td>
                                <td>{{ $location->User()->pluck('name')->implode(' ') }}</td>	{{-- Retrieve User associated to a Building Name and convert to string --}}
                                <td>{{ $location->modified_by }}</td>
                                <td>
                                    <div class="row">
                                        <div class="col-xs-1">
                                            <a href="{{ route('locations.edit', $location->id) }}" class="btn btn-info  btn-xs"><i class="fa fa-pencil"></i></a>
                                        </div>
                                        <div class="col-xs-1">                                
                                            {!! Form::model($location, ['method' => 'DELETE', 'route' => ['locations.destroy', $location->id], 'class' =>'form-inline form-delete']) !!}
                                            {!! Form::hidden('id', $location->id) !!}
                                            {{ Form::button('<i class="fa fa-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-xs btn-danger delete', 'name' => 'delete_modal'] ) }}
                                            {!! Form::close() !!}									
                                        </div>
                                        <div class="col-xs-1">
                                            <a href="{{ route('locations.show', $location->id) }}" class="btn btn-default  btn-xs"><i class="fa fa-eye"></i></a>
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

