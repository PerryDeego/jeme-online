{{-- \resources\views\errors\401.blade.php --}}
@extends('layouts.app-template')

@section('content')      
    <div class="row">
        <div id="timer" class="alert alert-danger">
            <button  type="button" class="close" data-dismiss="alert" aria-label="close">
                &times;
            </button>
                <strong>Notification: </strong>
                Insufficient privilege to access records!
        </div>
        <br>
        <div class="col-xs-offset-4 col-xs-4">
            <h4><center>{{ __('Insufficient Privilege') }}</center></h4><br>                
                <h1><center>401<br>
                ACCESS DENIED</center></h1>
            <br>
            <h4><a href="{{ route('dashboard') }}"><i class="fa fa-home"></i> Return Home</a></h4>
        </div>
    </div>
@endsection