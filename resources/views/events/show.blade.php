@extends('layouts.app-template')

@section('title', 'Details for ' . $building->name)

@section('content')
    
    <h3><i class='fa fa-gear'></i> <strong>Details for {{ $building->name }}</strong></h3>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">

                <div class="panel-heading"><h4>Building</h4></div>

                <div class="panel-body">
                    <div class="from-group row">
                        <div class="col-xs-2">
                            <strong>Building</strong> 
                        </div> 
                        <div class="col-xs-2">
                            {{ $building->name }}
                        </div>
                    </div>
                    <br>
					<div class="from-group row">
                        <div class="col-xs-2">
                            <strong>Service Number</strong> 
                        </div> 
                        <div class="col-xs-2">
                            {{ $building->Service()->pluck('service_no')->implode(' ') }}
                        </div>
                    </div>
					<br>
                    <div class="from-group row">
                        <div class="col-xs-2">
                            <strong>Location</strong> 
                        </div> 
                        <div class="col-xs-2">
                                {{ $building->Location()->pluck('name')->implode(' ') }}
                        </div>
                    </div>
                    <br><hr>
                    <div class="from-group">
                        <div class="col-sm-1">
                            <a href="{{ route('buildings.create', $building->id) }}" class="btn btn-success btn-block btn-sm"><i class="fa fa-plus-circle"> Add</i></a>
                        </div>
                        <div class="col-sm-1">
                                {!! Form::model($building, ['method' => 'DELETE', 'route' => ['buildings.destroy', $building->id], 'class' =>'form-inline form-delete']) !!}
                                {!! Form::hidden('id', $building->id) !!}
                                {{ Form::button('<i class="fa fa-trash"> Delete</i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-block btn-sm', 'name' => 'delete_modal'] ) }}
                                {!! Form::close() !!}	
                        </div> 
                        <div class="col-sm-1">
                            <a href="{{ route('buildings.edit', $building->id) }}" class="btn btn-info btn-block btn-sm"><i class="fa fa-pencil"> Edit</i></a>
                        </div>
                        <div class="col-sm-1">
                            <a href="{{ route('buildings.index') }}" class="btn btn-default btn-block btn-sm"><i class="fa fa-mail-forward"> Back</i></a>
                        </div> 
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection