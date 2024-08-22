<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{{ $title }}</title>

<!-- Google Font: Source Sans Pro -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<!-- Font Awesome -->
<link rel="stylesheet" href="/template/admin/plugins/fontawesome-free/css/all.min.css">
<link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.2.0/css/all.css" />
<link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.2.0/css/sharp-solid.css">
<link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.3.0/css/sharp-regular.css">
<!-- icheck bootstrap -->
<link rel="stylesheet" href="/template/admin/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/template/admin/dist/css/adminlte.css">
<link rel="stylesheet" href="/template/admin/dist/css/adminlte.min.css">
<link rel="stylesheet" href="/template/admin/dist/css/loading.css">
<link rel="stylesheet" href="/template/admin/dist/css/print.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" integrity="sha512-pumBsjNRGGqkPzKHndZMaAG+bir374sORyzM3uulLV14lN5LyykqNk8eEeUlUkB3U0M4FApyaHraT65ihJhDpQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="icon" href="/template/admin/dist/img/adminLG.png">
<meta name="csrf-token" content="{{ csrf_token() }}">
<link rel="stylesheet" href="/template/admin/dist/css/loginadmin.css">
<link rel="stylesheet" href="/template/admin/dist/css/chat.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

{{-- <link rel="stylesheet" href="/template/admin/plugins/chart.js/chart.min.css"> --}}

<link href="/template/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>
<script src="/template/bootstrap/js/bootstrap.bundle.min.js" >
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js" integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="/template/vendor/Chart.js/Chart.min.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.6.1/socket.io.min.js" integrity="sha512-AI5A3zIoeRSEEX9z3Vyir8NqSMC1pY7r5h2cE+9J6FLsoEmSSGLFaqMQw8SWvoONXogkfFrkQiJfLeHLz3+HOg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

@yield('head')
