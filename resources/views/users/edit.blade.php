{{-- \resources\views\users\edit.blade.php --}}

@extends('layouts.app-template')

@section('title', '| Edit User')

@section('content')
<h4><i class='fa fa-user-plus'></i> Edit User - {{ $user->name }}</h4>
<div class="row">
    <div class="col-xs-12">
        <div class="panel panel-default">
            <div class="panel-heading"><h5><i class='fa fa-edit'></i> Edit User here</h5></div>
            <div class="panel-body">

                   {{-- Show errrors for input fields. --}}
                    @include('errors.list')
                    
                    {{-- Using the Laravel HTML Form Collective to create our form --}}
                    {{ Form::model($user, array('route' => array('users.update', $user->id), 'method' => 'PUT')) }}{{-- Form model binding to automatically populate our fields with user data --}}
                    <div class="form-group">
                        {{ Form::label('name', 'Name:') }}
                        {{ Form::text('name', null, array('class' => 'form-control')) }}   
					</div>
					<div class="form-group">
                        {{ Form::label('email', 'Email:') }}
                        {{ Form::email('email', null, array('class' => 'form-control')) }}
                    </div>
					<div class="form-group">
                        <h5><b>Assign Roles to User:</b></h5>
                        <small>
                            @foreach ($roles as $role)
                                {{ Form::checkbox('roles[]',  $role->id, $user->roles ) }}
                                {{ Form::label($role->name, ucfirst($role->name)) }}
                            @endforeach
                        </small>
                    </div>
                    <div class="form-group" style="color: orange;">
                        {{ Form::label('status', 'Status* &nbsp;') }}
                        {{ Form::radio('status', '1', 'true') }} {{ Form::label('active', 'Active') }}
                        {{ Form::radio('status', '0', 'false') }} {{ Form::label('deactive', 'De Active') }}
                    </div>
					<div class="form-group">
                        {{ Form::label('password', 'Password') }}
                        {{ Form::password('password', array('class' => 'form-control', 'readonly' => 'true')) }}
                    </div>
                    <div class="form-group">
                        {{ Form::label('password', 'Confirm Password') }}
                        {{ Form::password('password_confirmation', array('class' => 'form-control', 'readonly' => 'true')) }}
					</div>
					<div class="from-group">
                        {{ Form::button('<i class="fa fa-edit"> Edit User</i>', ['type' => 'submit', 'class' => 'btn btn-warning btn-sm pull-right']) }}
                        <a href="{{ route('users.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
                        {{ Form::close() }}
                    </div>				
                </div>
            </div>
        </div>
    </div>
@endsection
