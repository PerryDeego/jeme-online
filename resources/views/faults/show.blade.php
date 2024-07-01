{{-- resources/views/faults/show.blade.php --}}
@extends('layouts.app-template')

@section('title', '| View Single Fault Log')

@section('content')
<div class="row">	
	<div class="col-xs-12">
		<div class="panel panel-default">
			<div class="panel-heading">
                <h3>
					<i class="fa fa-file-text"></i> View Single Fault Log
					<a href="{{ route('faults.index')}}" class="btn btn-primary btn-sm pull-right"><i class="fa fa-share-square-o"> Back</i></a>
					<a href="{{ route('faults.edit', $fault->id) }}" class="btn btn-warning btn-sm pull-right"><i class="fa fa-edit"> Edit</i></a>
					<a href="{{ route('faults.edit', $fault->id) }}" class="btn btn-danger btn-sm pull-right"><i class="fa fa-trash"> Delete</i></a>
                </h3>
				(Only users associated with the Admin Permission can modify this record) 
			</div>
			
			<div class="panel-body">
				<!-- page content -->
				<h5>Fault Log
					<small>Create At - {{ $fault->created_at->format('F d, Y h:ia') }}</small>
				</h5>
				
				<table class="table table-stripe table-fixed">
					<thead>
					<tr>
						<th style="width:40%;">Name</th>
						<th style="width:60%;">Details</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td><strong>Service No.</strong></td>
						<td>{{ $fault->Service()->pluck('service_no')->implode(' ') }}</td>
					</tr>
					<tr>
						<td><strong>Machine No.</strong></td>
						<td>{{ $fault->Machine()->pluck('machine_no')->implode(' ') }}</td>
					</tr>
					<tr>
						<td><strong>Building Name</strong></td>
						<td>{{ $fault->Building()->pluck('name')->implode(' ') }}</td>
					</tr>
					<tr>
						<td><strong>Location Name</strong></td>
						<td>{{ $fault->Location()->pluck('name')->implode(' ') }}</td>
					</tr>
					<tr>
						<td><strong>Fault Status</strong></td>
						<td>{{ $fault->status }}</td>
					</tr>
					<tr>
						<td><strong>Created By</strong></td>
						<td>{{ $fault->User()->pluck('name')->implode(' ') }}</td>
					</tr>
					<tr>
						<td><strong>Last Updated By</strong></td>
						<td>{{ $fault->modified_by }}</td>
					</tr>
					<tr>
						<td class="fix-col"><strong>Issue Description</strong></td>
						<td class="fix-col">{{ $fault->issue }}</td>
					</tr>
					</tbody>
				</table>
				@if(!$images->isEmpty())
				<br><button class="btn btn-block" disabled><strong>Fault image(s) Saved</strong></button><br>
					@foreach($images as $image)
						<div class="img_container">
							<a href="#">
								<img src="{{ URL::to('images/fault_images/'.$image)}}" alt="image" title="Fault Image">
							</a>
							{{ $image }}
						</div><br>
					@endforeach
				@endif
				<!-- /page content -->
            </div>
        </div>
    </div>
</div>
@endsection


