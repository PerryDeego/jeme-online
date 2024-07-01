{{-- \resources\views\events\index.blade.php --}}
@extends('layouts.app-template')

@section('title', '| Reminder List')

@section('content')
<div class="row">
    <div class="col-xs-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3>
                    <i class="fa fa-calendar"></i> Reminder List
                    <a href="{{ route('events.create') }}" class="btn btn-primary  btn-sm pull-right"><i class="fa fa-plus"> Add event</i></a>
                </h3>
                (Only users associated with the Admin Roles & Permissions have privilege to modifiy contents) 
            </div>
            
            <div class="panel-body">
               
                <div class="table-responsive-xs">
                    <table class="table table-hover table-xs" data-toggle="dataTable" data-form="deleteConfirm" id="tbl-list">
                        <thead>
                            <tr>
                                <th>Reminder</th>
                                <th>Start Date</th>
                                <th>End Date</th>
								<th>Status</th>
                                <th>Created By</th>
                                <th>Modified By</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($events as $event)
                            <tr>
                                <td>{{ $event->event_name }}</td>
                                <td>{{ $event->start_date }}</td>	
                                <td>{{ $event->end_date }}</td>
								<td>
									@if($event->status == 'open')
                                        <span class="label label-success"> {{ $event->status }} </span>
                                    @else
                                        <span class="label label-danger"> {{ $event->status }} </span>
                                    @endif
								</td>
                                <td>{{ $event->User()->pluck('name')->implode(' ') }}</td>	{{-- Retrieve User associated to a event and convert to string --}}
                                <td>{{ $event->modified_by }}</td>
                                <td>
                                    <div class="row">
                                        <div class="col-xs-1">
                                            <a href="{{ route('events.edit', $event->id) }}" class="btn btn-info  btn-xs"><i class="fa fa-pencil"></i></a>
                                        </div>
                                        <div class="col-xs-1">                                
                                            {!! Form::model($event, ['method' => 'DELETE', 'route' => ['events.destroy', $event->id], 'class' =>'form-inline form-delete']) !!}
                                            {!! Form::hidden('id', $event->id) !!}
                                            {{ Form::button('<i class="fa fa-trash"></i>', ['type' => 'submit', 'class' => 'btn btn-xs btn-danger delete', 'name' => 'delete_modal'] ) }}
                                            {!! Form::close() !!}									
                                        </div>
                                        <div class="col-xs-1">
                                            <a href="{{ route('events.show', $event->id) }}" class="btn btn-default  btn-xs"><i class="fa fa-eye"></i></a>
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
        
		<br><caption>Veiw Calendar Schedules & Reminders</caption>
		<div class="x_panel">
            <ul class="nav navbar-right panel_toolbox">
                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                </li>
            </ul>
            <div class="x_content">	
                <h2><b>Job Schedules<small> & Reminders</small></b></h2>
                <div class="panel panel-primary">
                    <div class="panel-heading">MY Event Details</div>
                    <div class="panel-body" >
                            
                        {!! $calendar_details->calendar() !!}
                        {!! $calendar_details->script() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

