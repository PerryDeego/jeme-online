{{-- \resources\views\service-numbers\shows.blade.php --}}
@extends('layouts.app-template')

@section('title', 'Details for ' . $service_number->service_number)

@section('content')
    
    <h3>
        <i class='fa fa-gear'></i> <strong>Details for {{ $service_number->service_no }}</strong> 
        <a href="{{ route('service-numbers.index') }}" class="btn btn-primary pull-right"><i class="fa fa-mail-forward"> Back</i></a>
    </h3> 
    <br>
	<div class="row">
	    <div class="col-xs-12">
		    <div class="panel panel-default">

                <div class="panel-heading" style="color:blue;"><h4>Service Number</h4></div>

                <div class="panel-body">
                    <div class="from-group row">
                        <div class="col-xs-2">
                            <strong>Service No</strong> 
                        </div> 
                        <div class="col-xs-2">
                                {{ $service_number->service_no }}
                        </div>
                    </div>
					<hr>
					<div class="from-group row">
                        <div class="col-xs-2">
                            <strong>Created By</strong> 
                        </div> 
                        <div class="col-xs-2">
                            {{ $service_number->User()->pluck('name')->implode(' ') }}
                        </div>
                    </div>
					<hr>
					<div class="from-group row">
                        <div class="col-xs-2">
                            <strong>Created At</strong> 
                        </div> 
                        <div class="col-xs-2">
                            {{ $service_number->created_at }}
                        </div>
                    </div>
                    <hr><br>
                    <div class="from-group">
                        <div class="col-sm-1">
                            <a href="{{ route('service-numbers.create', $service_number->id) }}" class="btn btn-success btn-block btn-sm"><i class="fa fa-plus-circle"> Add</i></a>
                        </div>
                        <div class="col-sm-1">
                                {!! Form::model($service_number, ['method' => 'DELETE', 'route' => ['service-numbers.destroy', $service_number->id], 'class' =>'form-inline form-delete']) !!}
                                {!! Form::hidden('id', $service_number->id) !!}
                                {{ Form::button('<i class="fa fa-trash"> Delete</i>', ['type' => 'submit', 'class' => 'btn btn-danger btn-block btn-sm', 'service_number' => 'delete_modal'] ) }}
                                {!! Form::close() !!}	
                        </div> 
                        <div class="col-sm-1">
                            <a href="{{ route('service-numbers.edit', $service_number->id) }}" class="btn btn-info btn-block btn-sm"><i class="fa fa-pencil"> Edit</i></a>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
@endsection