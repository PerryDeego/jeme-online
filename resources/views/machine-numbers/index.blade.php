{{-- \resources\views\machine_numbers\index.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Machine Number List')

@section('content')
<div class="row">
    <div class="col-xs-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3><i class="fa fa-th"></i> Machine Number List
                    <a href="{{ route('machine-numbers.create') }}" class="btn btn-primary  btn-sm pull-right"><i class="fa fa-plus"> Add Machine</i></a>
                    <a href="{{ route('buildings.index') }}" class="btn btn-default btn-sm pull-right">Building</a>
                </h3>
                (Only users associated with the Admin Roles & Permissions have privilege to modifiy contents) 
            </div>
            
            <div class="panel-body">
                <div class="table-responsive-xs">
                    <table class="table table-hover table-xs" data-toggle="dataTable" data-form="deleteConfirm" id="tbl-list">
                        <thead>
                            <tr>
                                <th>Machine No.</th>
                                <th>Building Name</th>
                                <th>Created By</th>
                                <th>Modified By</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($machine_numbers as $machine_number)
                            <tr>
                                <td>{{ $machine_number->machine_no }}</td>
                                <td>{{ $machine_number->Building()->pluck('name')->implode(' ') }}</td>{{-- Retrieve array of locations associated to a machine number and convert to string --}}
                                <td>{{ $machine_number->User()->pluck('name')->implode(' ') }}</td> {{-- Retrieve array of locations associated to a machine number and convert to string --}}
                                <td>{{ $machine_number->modified_by }}</td>
                                <td>
                                    <div class="row">
                                        <div class="col-xs-1">
                                            <a href="{{ route('machine-numbers.edit', $machine_number->id) }}" class="btn btn-info  btn-xs"><i class="fa fa-pencil"></i></a>
                                        </div>
                                        <div class="col-xs-1">                                
                                            {!! Form::model($machine_number, ['method' => 'DELETE', 'route' => ['machine-numbers.destroy', $machine_number->id], 'class' =>'form-inline form-delete']) !!}
                                            {!! Form::hidden('id', $machine_number->id) !!}
                                            {{ Form::button('<i class="fa fa-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-xs btn-danger delete', 'name' => 'delete_modal'] ) }}
                                            {!! Form::close() !!}									
                                        </div>
                                        <div class="col-xs-1">
                                            <a href="{{ route('machine-numbers.show', $machine_number->id) }}" class="btn btn-default  btn-xs"><i class="fa fa-eye"></i></a>
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

