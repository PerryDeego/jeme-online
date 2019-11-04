{{-- \resources\views\users\index.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Users')

@section('content')

<div class="row">
    <div class="col-xs-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3><i class="fa fa-users"></i> User Administration 
                    <a href="{{ route('users.create') }}" class="btn btn-primary btn-sm pull-right"><i class="fa fa-plus"> Add User</i></a>
                    <a href="{{ route('roles.index') }}" class="btn btn-default btn-sm pull-right">Roles</a>
                    <a href="{{ route('permissions.index') }}" class="btn btn-default btn-sm pull-right">Permissions</a>
                </h3>
                (Only users associated with the Admin Roles & Permissions can access this page) 
            </div>
            
            <div class="panel-body">
                <div class="table-responsive-xs">
                    <table class="table table-hover table-xs" data-toggle="dataTable" data-form="deleteConfirm" id="tbl-list">

                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Date/Time Added</th>
                                <th>User Roles</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>

                        <tbody>
                            @foreach ($users as $user)
                            <tr>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->email }}</td>
                                <td>{{ $user->created_at->format('F d, Y h:ia') }}</td>
                                <td>{{ $user->roles()->pluck('name')->implode(' ') }}</td>{{-- Retrieve array of roles associated to a user and convert to string --}}
                                <td>
                                    @if($user->status == 1)
                                        <span class="label label-success"> Active </span>
                                    @else
                                        <span class="label label-danger">DeActive</span>
                                    @endif
                                </td>
                                <td>
                                    <div class="row">
                                        <div class="col-xs-1">
                                            <a href="{{ route('users.edit', $user->id) }}" class="btn btn-info  btn-xs"><i class="fa fa-pencil"></i></a>
                                        </div>
                                        <div class="col-xs-1">   
                                            @if ($user->email != Auth::user()->email)                             
                                                {!! Form::model($user, ['method' => 'DELETE', 'route' => ['users.destroy', $user->id], 'class' =>'form-inline form-delete']) !!}
                                                {!! Form::hidden('id', $user->id) !!}
                                                {{ Form::button('<i class="fa fa-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-xs btn-danger delete', 'name' => 'delete_modal'] ) }}
                                                {!! Form::close() !!}
                                            @endif									
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

