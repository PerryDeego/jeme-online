{{-- resources/views/service-orders/index.blade.php --}}

@extends('layouts.app-template')

@section('title', '| Sevice service_ordersListing')

@section('content')
<div class="row">
    <div class="col-xs-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3><i class="fa fa-th"></i> Service Orders Administration
                    <a href="{{ URL::to('service-orders/create') }}" class="btn btn-primary btn-sm pull-right"><i class="fa fa-plus-circle"> Add</i></a>
                </h3>
                (Only users associated with the Admin Roles & Permissions have privilege to modifiy contents.) 
            </div>
            
            <div class="panel-body">
                  <div class="table-responsive-xs">
                    <table class="table table-striped table-xs" data-toggle="dataTable" data-form="deleteConfirm" id="tbl-list">
                        <thead>
                            <tr>
                                <th>Order No.</th>
                                <th>Service No.</th>
                                <th>Date</th>
                                <th>Building</th>
                                <th>Machine No.</th>
                                <th>Taken By</th>
                                <th>Workdone</th>
                                <th>Work Completed</th>
                                <th>Created At</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            @foreach ($service_orders as $service_order)
                            <tr>
                                <td>{{ $service_order->order_no }}</td> 
                                <td>{{ $service_order->Service()->pluck('service_no')->implode(' ')}}</td>   
                                <td>{{ $service_order->date }}</td>    
                                <td>{{ $service_order->Building()->pluck('name')->implode(' ') }}</td>      
                                <td>{{ $service_order->Machine()->pluck('machine_no')->implode(' ') }}</td>                     
                                <td>{{ Auth::user()->name }}</td>
                                <td>{{ $service_order->work_description }}</td>
                                <td>
                                    @if($service_order->status == 'Yes')
                                        <span class="label label-success">
                                            {{ $service_order->status }}
                                        </span>
                                    @else
                                        <span class="label label-warning">
                                            {{ $service_order->status }}
                                        </span>
                                    @endif
                                </td>

                                <td><i class="fa fa-calendar"> {{ $service_order->created_at }} </i></td>
                                
                                <td>
                                    <div class="row">
                                        <div class="col-xs-1">
                                            <a href="{{ route('service-orders.edit', $service_order->id) }}" class="btn btn-info  btn-xs"><small><i class="fa fa-pencil"></i></small></a>
                                        </div>
                                        <div class="col-xs-1">
                                            {!! Form::model($service_order, ['method' => 'DELETE', 'route' => ['service-orders.destroy', $service_order->id], 'class' =>'form-inline form-delete']) !!}
                                            {!! Form::hidden('id', $service_order->id) !!}
                                            {{ Form::button('<small><i class="fa fa-trash"></i></small>', ['type' => 'submit', 'class' => 'btn btn-xs btn-danger delete', 'name' => 'delete_modal'] ) }}
                                            {!! Form::close() !!}
                                        </div>
                                        <div class="col-xs-1">
                                            <a href="{{ route('service-orders.show', $service_order->id) }}" class="btn btn-default  btn-xs"><i class="fa fa-eye"></i></a>
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
