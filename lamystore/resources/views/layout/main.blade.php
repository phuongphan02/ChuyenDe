<!DOCTYPE html>
<html lang="en">

<head>
  @include('layout.head')
</head>

<body>
  <div id="loading"><span class="loader"></span></div>
  @include('layout.header')
  <main>
    @yield('main')
  </main>
  @include('layout.footer')
</body>

</html>
