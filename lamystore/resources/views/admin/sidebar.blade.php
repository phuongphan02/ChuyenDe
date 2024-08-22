<aside class="main-sidebar sidebar-dark-primary elevation-4" style="background:#FFD39B; position: fixed;">
  <!-- Brand Logo -->
  <a href="/admin/" class="text-decoration-none brand-link">
    <img src="/template/admin/dist/img/logolamy.jpg" alt="logo" class="brand-image img-circle elevation-3" style="opacity: .8">
    <span class="brand-text font-weight-light">Admin Lamy</span>
  </a>

  <!-- Sidebar -->
  <div class="sidebar">

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
        <li class="nav-item pagination">
          <a href="/admin" class="nav-link {{ request()->is('admin') ? 'active-sidebar' : '' }}">
            <i class="nav-icon fa-solid fa-house-chimney"></i>
            <p>Tổng quan</p>
          </a>
        </li>
        <li class="nav-item pagination">
          <a href="/admin/menus/list" class="nav-link {{ request()->is('admin/menus/*') ? 'active-sidebar' : '' }}">
            <i class="nav-icon fa-solid fa-list"></i>
            <p>Danh mục</p>
          </a>
        </li>
        <li class="nav-item pagination">
          <a href="/admin/sliders/list" class="nav-link {{ request()->is('admin/sliders/*') ? 'active-sidebar' : '' }}">
            <i class="nav-icon fas fa-images"></i>
            <p>Trình chiếu</p>
          </a>
        </li>

        <li class="nav-item pagination">
          <a href="/admin/users/list" class="nav-link {{ request()->is('admin/users/*') ? 'active-sidebar' : '' }}">
            <i class="nav-icon fa-regular fa-user"></i>
            <p>Nhân viên</p>
          </a>
        </li>
        <li class="nav-item pagination">
          <a href="/admin/trademarks/list" class="nav-link {{ request()->is('admin/trademarks/*') ? 'active-sidebar' : '' }}">
            <i class="nav-icon fa-solid fa-trademark"></i>
            <p>Thương hiệu</p>
          </a>
        </li>
        <li class="nav-item pagination">
          <a href="/admin/sales/list" class="nav-link {{ request()->is('admin/sales/*') ? 'active-sidebar' : '' }}">
            <i class="nav-icon fa-regular fa-ticket"></i>
            <p>Giảm giá</p>
          </a>
        </li>
        <li class="nav-item pagination">
          <a href="/admin/promotions/list" class="nav-link {{ request()->is('admin/promotions/*') ? 'active-sidebar' : '' }}">
            <i class="nav-icon fa-solid fa-percent"></i>
            <p>Khuyến mãi</p>
          </a>
        </li>
        <li class="nav-item pagination">
          <a href="/admin/product_types/list" class="nav-link {{ request()->is('admin/product_types/*') ? 'active-sidebar' : '' }}">
            <i class="nav-icon fa-brands fa-shopify"></i>
            <p>Loại sản phẩm</p>
          </a>
        </li>
        <li class="nav-item pagination">
          <a href="/admin/products/list" class="nav-link {{ request()->is('admin/products/*') ? 'active-sidebar' : '' }}">
            <i class="nav-icon fa-solid fa-laptop-mobile"></i>
            <p>Sản phẩm</p>
          </a>
        </li>
        <li class="nav-item pagination">
          <a href="/admin/customers/list" class="nav-link {{ request()->is('admin/customers/*') ? 'active-sidebar' : '' }}">
            <i class="nav-icon fa-solid fa-user"></i>
            <p>Khách hàng</p>
          </a>
        </li>
        <li class="nav-item pagination">
          <a href="/admin/orders/list" class="nav-link {{ request()->is('admin/orders/*') ? 'active-sidebar' : '' }}">
            <i class="nav-icon fa-sharp fa-regular fa-cart-shopping"></i>
            <p>Đơn hàng</p>
          </a>
        </li>
        {{-- <li class="nav-item pagination">
          <a href="/admin/contacts/list" class="nav-link {{ request()->is('admin/contacts/*') ? 'active-sidebar' : '' }}">
            <i class="nav-icon fa-regular fa-comments"></i>
            <p>Hỗ trợ</p>
          </a>
        </li> --}}
      </ul>
    </nav>
  </div>
  <!-- /.sidebar -->
</aside>
