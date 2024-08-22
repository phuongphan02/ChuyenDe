<html>
<head>
  <style>
    /*style mở ra một khu vực để viết mã CSS*/
    .main {
      background: rgb(255, 230, 214);
      max-width: 700px;
      margin: 0 auto;
      padding: 20px;
    }

    .link {
      display: flex;
      width: fit-content;
      margin: auto;
      padding: 10px 20px;
      background-image: linear-gradient(to right, #815e23, #815e23, #ffc979, #ffc979);
      background-size: 300%;
      border-radius: 10px;
      color: black;
    }

    .link:hover {
      background-position: right;
      color: white;
    }

  </style>
</head>
<body>
  <div class="main">
    <h2 style="text-align: center">Chào {{ $name }}</h2>
    <p>Bạn đã đăng ký tài khoản tại hệ thống của chúng tôi</p>
    <p>Để có thể tiếp tục sử dụng cho các dịch vụ, bạn vui lòng nhấn vào nút kích hoạt ở bên dưới để kích hoạt</p>
    <a href="" class="link">Kích hoạt tài khoản</a>
  </div>
</body>
</html>
