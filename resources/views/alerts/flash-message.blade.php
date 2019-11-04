@if(Session::has('login_message'))
<div class="row">
    <div class="col-xs-12">
        <div id="timer" class="alert alert-success">
            <button  type="button" class="close" data-dismiss="alert" aria-label="close">
                &times;
            </button>
                {{ session()->get('login_message') }} 
                <strong>{{ Auth::user()->name }}.</strong>
        </div>
    </div>
</div>
@endif

@if(Session::has('success_message'))
    <div class="row">
        <div class="col-xs-12">
            <div id="timer" class="alert alert-success">
                <button  type="button" class="close" data-dismiss="alert" aria-label="close">
                    &times;
                </button>
                    <strong>Notification: </strong>
                    {{ session()->get('success_message') }} 
            </div>
        </div>
    </div>
@endif
@if(Session::has('error_message'))
    <div class="row">
        <div class="col-xs-12">
            <div id="timer" class="alert alert-danger">
                <button  type="button" class="close" data-dismiss="alert" aria-label="close">
                    &times;
                </button>
                    <strong>Notification: </strong>
                    {{ session()->get('error_message') }}
            </div>
        </div>
    </div>
@endif   


    