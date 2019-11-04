{{-- \resources\views\service-numbers\index.blade.php --}}
@extends('layouts.app-template')

@section('title', '| ServiceNumber List')

@section('content')
<div class="row">
    <div class="col-xs-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>
                    <i class="fa fa-th"></i> Service Number List
                    <a href="{{ route('service-numbers.create') }}" class="btn btn-primary btn-sm pull-right"><i class="fa fa-plus"> Add Service No.</i></a>
                </h3>
                (Only users associated with the Admin Roles & Permissions have privilege to modifiy contents) 
            </div>
            
            <div class="panel-body">
                <div class="table-responsive-xs">
                    <table class="table table-hover table-xs" data-toggle="dataTable" data-form="deleteConfirm" id="tbl-list">
                        <thead>
                            <tr>
                                <th>Service No.</th>
                                <th>Created By</th>
                                <th>Modified By</th>
                                <th>Created At</th>
                                <th>Updated At</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($service_numbers as $service_number)
                            <tr>
                                <td>{{ $service_number->service_no }}</td>
                                <td>{{ $service_number->User()->pluck('name')->implode(' ') }}</td> {{-- Retrieve array of locations associated to a machine number and convert to string --}}
                                <td>{{ $service_number->modified_by }}</td>
                                <td>{{ $service_number->created_at }}</td>
                                <td>{{ $service_number->updated_at }}</td>
                                <td>
                                    <div class="row">
                                        <div class="col-xs-1">
                                            <a href="{{ route('service-numbers.edit', $service_number->id) }}" class="btn btn-info btn-xs"><i class="fa fa-pencil"></i></a>
                                        </div>
                                        <div class="col-xs-1">                                
                                            {!! Form::model($service_number, ['method' => 'DELETE', 'route' => ['service-numbers.destroy', $service_number->id], 'class' =>'form-inline form-delete']) !!}
                                            {!! Form::hidden('id', $service_number->id) !!}
                                            {{ Form::button('<i class="fa fa-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-xs btn-danger', 'name' => 'delete_modal'] ) }}
                                            {!! Form::close() !!}									
                                        </div>
                                        <div class="col-xs-1">
                                            <a href="{{ route('service-numbers.show', $service_number->id) }}" class="btn btn-default btn-xs"><i class="fa fa-eye"></i></a>
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

