<html>
<head>
  <style>
    .main {
      background: rgb(255, 238, 224);
      max-width: 700px;
      margin: 0 auto;
      padding: 20px;
    }

    .link {
      text-decoration: none;
      display: flex;
      width: fit-content;
      margin: auto;
      padding: 10px 20px;
      background-image: linear-gradient(to right, #815e23, #815e23, #ffc979, #ffc979);
      background-size: 300%;
      border-radius: 10px;
      color: rgb(0, 0, 0);
    }

    .link:hover {
      background-position: right;
      color: white;
    }

  </style>
</head>
<body>
  <div class="main">
    <h2 style="text-align: center">Chào {{ $customer->name }}</h2>
    <p>Bạn đã đăng ký tài khoản tại hệ thống của chúng tôi</p>
    <p>Để có thể tiếp tục sử dụng cho các dịch vụ, bạn vui lòng nhấn vào nút kích hoạt ở bên dưới để kích hoạt</p>
    <a href="{{ route('home.actived',['customer' => $customer->id, 'token' => $customer->token ]) }}" class="link" style="color: black">Kích hoạt tài khoản</a>
  </div>
</body>
</html>
