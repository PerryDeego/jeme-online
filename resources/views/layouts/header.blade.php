<header class="main-header">
  <!-- Logo -->
  <a href="index2.html" class="logo">
    <!-- mini logo for sidebar mini 50x50 pixels -->
    <span class="logo-mini"><b>JE</b>ME</span>
    <!-- logo for regular state and mobile devices -->
    <span class="logo-lg"><b>JEME | </b>OTIS</span>
  </a>
  <!-- Header Navbar: style can be found in header.less -->
  <nav class="navbar navbar-static-top skin-white">
    <!-- Sidebar toggle button-->
    <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </a>

    <div class="navbar-custom-menu">
      <ul class="nav navbar-nav">
        <!-- Notifications: style can be found in dropdown.less -->
        <li class="dropdown notifications-menu">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <i class="fa fa-bell-o"></i>
            <span class="label label-warning">10</span>
          </a>
          <ul class="dropdown-menu">
            <li class="header">You have 10 notifications</li>
            <li>
              <!-- inner menu: contains the actual data -->
              <ul class="menu">
                <li>
                  <a href="#">
                    <i class="fa fa-users text-aqua"></i> 5 new members joined today
                  </a>
                </li>
              </ul>
            </li>
            <li class="footer"><a href="#">View all</a></li>
          </ul>
        </li>
        
        <!-- User Account: style can be found in dropdown.less -->
        <li class="dropdown user user-menu">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            <img src="{{ asset('dist/img/admin.jpg') }}" class="user-image" alt="User Image">
            @if (Auth::check())
              <span class="hidden-xs">{{ Auth::user()->name }}</span>
            @else 
              {{ Auth::logout() }}
            @endif
          </a>
          <ul class="dropdown-menu">
            <!-- User image -->
            <li class="user-header">
              <img src="{{ asset('dist/img/admin.jpg') }}" class="img-circle" alt="User Image">

              <p>
                  @if (Auth::check())
                    {{ Auth::user()->name }} - Web Developer
                    <small>Member since Nov. 2015</small>
                  @else 
                    {{ Auth::logout() }}
                  @endif
              </p>
            </li>
            <!-- Menu Body -->
            <li class="user-body">
              <div class="row">
                <div class="col-xs-4 text-center">
                  <a href="#">Requests</a>
                </div>
                <div class="col-xs-4 text-center">
                  <a href="#">Service</a>
                </div>
                <div class="col-xs-4 text-center">
                  <a href="#">New Jobs</a>
                </div>
              </div>
              <!-- /.row -->
            </li>
            <!-- Menu Footer-->
            <li class="user-footer">
              <div class="pull-left">
                <a href="#" class="btn btn-default btn-flat">Profile</a>
              </div>
              <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat" href="{{ route('logout') }}" onclick="event.preventDefault();
                  document.getElementById('logout-form').submit();">Sign out</a>
              </div>
              <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                  @csrf
              </form>

            </li>
          </ul>
        </li>
       
      </ul>
    </div>
  </nav>
</header>

