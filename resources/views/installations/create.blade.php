{{-- \resources\views\installations\create.blade.php --}}

@extends('layouts.app-template')

@section('title', '| Add New Installation Job')

@section('content')
<br>
<div class="container">
    <div class="row">
        <div class="col-sm-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading"><h1><i class='fa fa-list'></i> Create New Installation Job</h1></div>
                <div class="panel-body">
					
					{{-- Show errrors for input fields. --}}
					@include('errors.list')
					
					{{-- Using the Laravel HTML Form Collective to create our form --}}
					{{ Form::open(array('route' => 'installations.store')) }}
					
					<div class="row">
						<div class="col-sm-4">
							{{ Form::label('job_number', 'Job No.') }}
							{{ Form::text('job_number', null, array('class' => 'form-control')) }}
						</div>
						<div class="col-sm-4">
							{{ Form::label('contract_number', 'Contract No.') }}
							{{ Form::text('contract_number', null, array('class' => 'form-control')) }}
						</div>
						<div class="col-sm-4">
							{{ Form::label('name', 'Jobs Name') }}
							{{ Form::text('name', null, array('class' => 'form-control')) }}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							{{ Form::label('erector', 'Erector') }}
							{{ Form::text('erector', null, array('class' => 'form-control')) }}
						</div>
						<div class="col-sm-4">
							{{ Form::label('status', 'Status') }}
							{{ Form::text('status', null, array('class' => 'form-control')) }}
						</div>
						<div class="col-sm-4">
							{{ Form::label('location', 'Location') }}
							{{ Form::text('location', null, array('class' => 'form-control')) }}
						</div>
					</div>
					<div class="row">
						<div class="col-sm-4">
							{{ Form::label('start_date', 'Start Date') }}
							{{ Form::date('start_date', null, array('class' => 'form-control')) }}
						</div> 
						<div class="col-sm-4">
							{{ Form::label('end_date', 'End Date') }}
							{{ Form::date('end_date', null, array('class' => 'form-control')) }}
						</div> 
					</div>	
					<div class="row">
						<div class="col-sm-4">
							<br>{{ Form::button('<i class="fa fa-plus-circle"> Add Installation</i>', ['type' => 'submit', 'class' => 'btn btn-success btn-sm btn-block']) }}
							{{ Form::close() }}
						</div>
						<div class="col-sm-4">
							<br><a href="{{ url()->previous() }}" class="btn btn-primary btn-sm btn-block">Back <i class="fa fa-mail-forward"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>	
	</div>
</div>
@endsection