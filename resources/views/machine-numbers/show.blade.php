@extends('layouts.app-template')

@section('title', 'Details for ' . $machine_number->machine_no)

@section('content')
    
    <h3><i class='fa fa-gear'></i> <strong>Details for {{ $machine_number->machine_no }}</strong></h3>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">

                <div class="panel-heading"><h4>Machine Number</h4></div>

                <div class="panel-body">
                    <div class="from-group row">
                        <div class="col-xs-2">
                            <strong>Machine Number</strong> 
                        </div> 
                        <div class="col-xs-2">
                                {{ $machine_number->machine_no }}
                        </div>
                    </div>
                    <br>
                    <div class="from-group row">
                        <div class="col-xs-2">
                            <strong>Building</strong> 
                        </div> 
                        <div class="col-xs-2">
                                {{ $machine_number->Building()->pluck('name')->implode(' ') }}
                        </div>
                    </div>
                    <br><hr>
                    <div class="from-group">
                        <div class="col-sm-1">
                            <a href="{{ route('machine-numbers.create', $machine_number->id) }}" class="btn btn-success btn-block btn-sm"><i class="fa fa-plus-circle"> Add</i></a>
                        </div>
                        <div class="col-sm-1">
                                {!! Form::model($machine_number, ['method' => 'DELETE', 'route' => ['machine-numbers.destroy', $machine_number->id], 'class' =>'form-inline form-delete']) !!}
                                {!! Form::hidden('id', $machine_number->id) !!}
                                {{ Form::button('<i class="fa fa-trash"> Delete</i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-block btn-sm', 'name' => 'delete_modal'] ) }}
                                {!! Form::close() !!}	
                        </div> 
                        <div class="col-sm-1">
                            <a href="{{ route('machine-numbers.edit', $machine_number->id) }}" class="btn btn-info btn-block btn-sm"><i class="fa fa-pencil"> Edit</i></a>
                        </div>
                        <div class="col-sm-1">
                            <a href="{{ route('machine-numbers.index') }}" class="btn btn-default btn-block btn-sm"><i class="fa fa-mail-forward"> Back</i></a>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection