@if(Session::has('status_error'))
    <div class="alert alert-danger" id="timer">
            <strong>Notification: </strong>
            {{ session()->get('status_error') }}
    </div>
@endif  


    