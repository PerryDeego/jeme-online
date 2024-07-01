<!DOCTYPE html>
<html l bn ang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- CSRF Token -->
  <meta name="csrf-token" content="{{ csrf_token() }}">

  <title>JEME | Job Management</title>
   <!-- Links & Scripts Content -->
   @include('layouts.links')
   <!-- /.content-links-scripts -->
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">
    
      <!-- Header Content -->
      @include('layouts.header')
      <!-- /.content-header -->

      <!-- =============================================== -->
      <!-- Sidebar Content -->
      @include('layouts.sidebar')
      <!-- /.content-sidebar -->
      <!-- =============================================== -->

      <!-- =============================================== -->
      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        
         <!-- Flash-message Content -->
         @include('alerts.flash-message')
         <!-- /.content flash-message--> 

          <div class="container-fluid">  

            <!-- Include modal_confirm php file in views/includes -->
            @include('modals.modal-confirm')
            
            <!-- Content (Page) -->
            @yield('content')
          </div> 
          
      </div> 
      <!-- /.content-wrapper -->
      <!-- =============================================== -->
    
      <!-- Main Footer Content -->
      @include('layouts.footer')
      <!-- /.content-footer -->

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
        <!-- Create the tabs -->
        <ul class="nav nav-tabs nav-justified control-sidebar-tabs">
          <li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>
          <li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>
        </ul>
        <!-- Tab panes -->
        </div>
      </aside>
      <!-- /.control-sidebar -->
      <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
      <div class="control-sidebar-bg"></div>
  </div>
    <!-- ./wrapper -->

    <!-- Script Controls Content -->
    @include('scripts.control-scripts')
    <!-- /.content script-controls-->

    <!-- Script Controls Content -->
    @include('scripts.dynamic-scripts')
    <!-- /.content script-controls-->

</body>
</html>
    
