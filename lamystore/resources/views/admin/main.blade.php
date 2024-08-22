<!DOCTYPE html>
<html lang="en">

<head>
  @include('admin.head')
  <style>
    .btn{
      transition: 0.3s;
    }
    .active-sidebar {
      /* border-radius: 50px 0 0 50px !important; */
      /* background: #DFFFD8 !important; */
      background: #F1F6F9!important;
      color: black !important;
      position: relative !important;
      margin-right: -8px!important;
    }

    /* .active-sidebar::before{
      content: ''!important;
      position: absolute!important;
      background: #FFD39B!important;
      right: -8px!important;
      width: 15px!important;
      height: 15px!important;
      top:-15px!important;
      border-bottom-right-radius: 15px!important;
      box-shadow: 15px 15px 0 15px #DFFFD8 !important;
    }
    .active-sidebar::after{
      content: ''!important;
      position: absolute!important;
      background: #FFD39B!important;
      right: -8px!important;
      width: 15px!important;
      height: 15px!important;
      bottom:-15px!important;
      border-top-right-radius: 15px!important;
      box-shadow: 15px -15px 0 15px #DFFFD8 !important;
    } */

    .content-img {
      /* background: linear-gradient(to right, #DFFFD8, #B4E4FF); */
      background: #F1F6F9;
    }

    .main-sidebar {
      transition: 0.5s;
    }

    .avatar {
      position: relative;
      margin-right: 60px;
      margin-left: auto;
    }

    .avatar .avatar-link {
      text-decoration: none;
      color: white;
      transition: 0.2s;
    }

    .avatar .avatar-link:hover {
      color: rgb(255, 230, 214);
    }

    .avatar ul {
      padding: 0;
      display: none;
      list-style: none;
      position: absolute;
      left: 10px;
      width: 130px;
      top: 40px;
      box-shadow: 0 4px 8px 0 #ffc979, 0 6px 20px 0 #ffc97919);
      background: #FFD39B;
    }

    .avatar ul li {
      padding: 10px;
    }

    .avatar ul a {
      display: flex;
      align-items: center;
      text-decoration: none;
      color: white;
    }

    .avatar ul a:hover {
      color: rgb(255, 230, 214);
    }

    .avatar ul i {
      width: 30px;
      text-align: center;
    }

    .avatar i {
      transform: rotate(0);
      transition: all 0.3s;
    }

    .avatar.show .fa-chevron-down {
      transform: rotate(-180deg);
      transition: all 0.3s;
    }

    .avatar.show .avatar-link {
      color: rgb(255, 230, 214);
    }

    .avatar.show ul {
      display: block;
    }

    @media only screen and (max-width: 1023.98px) {
      body{
        font-size: 12px;
      }
    }
    @media only screen and (max-width: 767.98px) {
      body{
        font-size: 10px;
      }
    }
    @media only screen and (max-width: 479.98px) {
      body{
        font-size: 8px;
      }
    }

  </style>
</head>

<body class="hold-transition sidebar-mini">
  <div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand navbar-white navbar-light sticky-top" style="background:#FFD39B">
      <!-- Left navbar links -->
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="text-light nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>

      </ul>
      <!-- Sidebar user (optional) -->
      <div class="avatar ms-auto">
        <div class="avatar-link user-panel d-flex align-items-center" role="button">
          <div class="image mr-2 d-flex align-items-center">
            <img src="{{ Auth::user()->thumb }}" class="img-circle elevation-2" alt="User Image">
            <b class="ml-2">{{ Auth::user()->name }}</b>
          </div>
          <i class="fa-solid fa-chevron-down"></i>
        </div>
        <ul class="avatar-detail">
          <li><a href="/admin/info"><i class="fa-solid fa-info"></i> Chi tiết</a></li>
          <li>
            <button type="button" class="border-0 text-white p-0" style="background: none" data-bs-toggle="modal" data-bs-target="#exampleModal">
              <i class="fa-solid fa-right-from-bracket"></i> Đăng xuất
            </button>
            
            <!-- Modal -->
            
            {{-- <a href="{{ route('admin.logout') }}"><i class="fa-solid fa-right-from-bracket"></i> Đăng xuất</a> --}}
          </li>
        </ul>
      </div>



      {{-- <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" data-widget="fullscreen" href="#" role="button">
          <i class="fas fa-expand-arrows-alt"></i>
        </a>
      </li>
    </ul> --}}
    </nav>
    <!-- /.navbar -->

    @include('admin.sidebar')

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper content-img" style="min-height: 92.5vh">

      <!-- Main content -->
      <section class="content">
        <div class="container-fluid">
          @include('admin.alert')
          <div class="row">
            <!-- left column -->
            <div class="col-md-12">
              <!-- jquery validation -->
              <div class="card card-info border-info mt-3">
                <div class="card-header">
                  <h3 class="card-title pt-2">{{ $title }}</h3>
                </div>

                <div class="p-3">
                  @yield('content')
                </div>
              </div>
              <!-- /.card -->
            </div>
          </div>
          <!-- /.row -->
        </div><!-- /.container-fluid -->
      </section>
      <!-- /.content -->
    </div>

    <!-- /.control-sidebar -->
  </div>
  <!-- ./wrapper -->
  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Đăng xuất</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Bạn có chắc là muốn đăng xuất tài khoản trên hệ thống không?
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
          <a href="{{ route('admin.logout') }}" type="button" class="btn btn-danger">Đăng xuất</a>
        </div>
      </div>
    </div>
  </div>
  @include('admin.footer')
</body>

</html>
