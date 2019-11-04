@extends('layouts.app-template')

@section('title', 'Details for ' . $location->name)

@section('content')
    
    <h3>
        <i class='fa fa-gear'></i> <strong>Details for {{ $location->name }}</strong> 
        <a href="{{ route('locations.index') }}" class="btn btn-primary pull-right"><i class="fa fa-mail-forward"> Back</i></a>
    </h3> 
    <br>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">

                <div class="panel-heading"><h4>Location</h4></div>

                <div class="panel-body">
                    <div class="from-group row">
                        <div class="col-xs-2">
                            <strong>location</strong> 
                        </div> 
                        <div class="col-xs-2">
                                {{ $location->name }}
                        </div>
                    </div>
                    <br>
                    <br><hr>
                    <div class="from-group">
                        <div class="col-sm-1">
                            <a href="{{ route('machine-numbers.create', $location->id) }}" class="btn btn-success btn-block btn-sm"><i class="fa fa-plus-circle"> Add</i></a>
                        </div>
                        <div class="col-sm-1">
                                {!! Form::model($location, ['method' => 'DELETE', 'route' => ['machine-numbers.destroy', $location->id], 'class' =>'form-inline form-delete']) !!}
                                {!! Form::hidden('id', $location->id) !!}
                                {{ Form::button('<i class="fa fa-trash"> Delete</i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-block btn-sm', 'name' => 'delete_modal'] ) }}
                                {!! Form::close() !!}	
                        </div> 
                        <div class="col-sm-1">
                            <a href="{{ route('machine-numbers.edit', $location->id) }}" class="btn btn-info btn-block btn-sm"><i class="fa fa-pencil"> Edit</i></a>
                        </div>
                        <div class="col-sm-1">
                                   </div> 
                    </div>
                </div>
            </div>
            
        </div>
    </div>
@endsection