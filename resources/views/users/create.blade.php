{{-- \resources\views\users\create.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Add User')

@section('content')

    <h4><i class='fa fa-user-plus'></i> Add New User</h4>
    <div class="row">
        <div class="col-xs-12">
            <div class="panel panel-default">
                <div class="panel-heading"><h5><i class='fa fa-check-circle-o'></i> Create new User here</h5></div>
                <div class="panel-body">

                    {{-- Show errrors for input fields. --}}
                    @include('errors.list')
                
                    {{-- Using the Laravel HTML Form Collective to create our form --}}
                    {{ Form::open(array('route' => 'users.store')) }}
                    <div class="form-group">
                        {{ Form::label('name', 'Name:') }}
                        {{ Form::text('name', '', array('class' => 'form-control','placeholder' => 'Name')) }}
                    </div>
                    <div class="form-group">
                        {{ Form::label('email', 'Email:') }}
                        {{ Form::email('email', '', array('class' => 'form-control', 'placeholder' => 'Email')) }}
                    </div>
                    <div class="form-group">
                        <h5><b>Assign Roles to User:</b></h5>
                        <small>
                            @foreach ($roles as $role)
                                {{ Form::checkbox('roles[]',  $role->id ) }}
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
                        {{ Form::label('password', 'Password:') }}
                        {{ Form::password('password', array('class' => 'form-control', 'placeholder' => 'Password')) }}
                    </div>
                    <div class="form-group">
                        {{ Form::label('password', 'Confirm Password:') }}
                        {{ Form::password('password_confirmation', array('class' => 'form-control', 'placeholder' => 'Confirm Password')) }}
                    </div>
                    <br>
                    <div class="from-group">
                        {{ Form::button('<i class="fa fa-plus-circle"> Add User</i>', ['type' => 'submit', 'class' => 'btn btn-success btn-sm pull-right']) }}
                        <a href="{{ route('users.index') }}" class="btn btn-sm pull-right"><i class="fa fa-window-close"></i> Cancel</a>
                        {{ Form::close() }}
                    </div>				
                </div>
            </div>
        </div>
    </div>

@endsection