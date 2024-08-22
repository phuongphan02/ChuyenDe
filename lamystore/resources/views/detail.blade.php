@extends('layout.main')
@section('main')
<section class="main-detail">
  <div class="container">
    <div class="main-detail-head">
      <div class="left">
        <div class="main-detail-head-img">
          <img class="img-fluid" src="{{ $product->thumb }}" alt="{{ $product->name }}" width="100%">
        </div>
        <div class="main-detail-head-name">
          <h4>{{ $product->name }}</h4>
          <p class="mb-2">Loại: {{ $product->producttype->name }}</p>
          <p class="mb-2">Thương hiệu: <a href="{{ $product->trademark->url }}" style="color: #815e23;"><b>{{ $product->trademark->name }}</b></a></p>
          <p class="mb-2">Số lượng: {{ $product->quantity }} <b class="text-danger {{ ($product->quantity == 0) ? '' : 'd-none' }}">( Sản phẩm đã hết hàng )</b></p>
          <div class="price mt-4">
            @if($product->promotion->sale != 0)
            <h6><del>{{ number_format($product->price, 0, '.', '.') }}₫</del> <small>{{ $product->promotion->name }}</small> </h6>
            @endif
            <h5>{{ number_format($product->price - $product->price * $product->promotion->sale, 0, '.', '.') }}₫</h5>
          </div>
          <div class="mt-4 mb-3">
            <form method="POST" action="/addcart" class="add-to-cart-form">
              <div class="col-4 mb-3 d-flex">
                <button type="button" class="btn-add w-25 btn-qtt-minus"><i class="fa-solid fa-minus"></i></button>
                <input class="input-quantity text-center" type="number" name="num_product" value="0" min="1" max="{{ $product->quantity }}" style="
              border: 1px solid gray;">
                <button type="button" class="btn-add w-25 btn-qtt-plus"><i class="fa-solid fa-plus"></i></button>
              </div>
              <input type="hidden" name="product_id" value="{{ $product->id }}">
              <div class="col-12">
                <button type="submit" class="btn btn-buy w-100 add-to-cart-button" {{ ($product->quantity == 0) ? "disabled" : "" }}>THÊM VÀO GIỎ HÀNG</button>
              </div>
              @csrf
            </form>
          </div>
        </div>
        <hr class="w-100 px-3">
        <div class="main-detail-head-configuration">
          {!! str_replace('-', '<br> - ', $product->description) !!}
        </div>
        <div class="main-detail-head-promotion">
          <div class="mb-3"><b>CHÍNH SÁCH ĐỔI TRẢ HÀNG CỦA LAMY STORE</b></div>
          <ul>
            <li class="mb-3"> Đổi trả, hoàn tiền cho khách nếu phát sinh lỗi của nhà sản xuất hoặc lỗi do Shop, hàng không đúng mẫu, hàng không đủ số lượng trong đơn hàng. <a href="#">Xem chi tiết</a></li>
            <li class="mb-3">Bạn phải quay lại video khi mở, bóc gói hàng để shop có căn cứ xác minh khi khách hàng gặp vấn đề liên quan đến sản phẩm
                          </li>
            <li>Lưu ý : Vì số lượng đơn lớn  nên shop gói theo phân loại màu khách đặt --- shop không gói theo ghi chú hoặc tin nhắn được.</a></li>
          </ul>
        </div>
      </div>
      <div class="right">
        <div class="main-detail-head-company d-flex align-items-center">
          <div class="company-img">
            <img src="/template/admin/dist/img/logolamy.jpg" class="img-fluid" alt="">
          </div>
          <h6 class="ms-4 mb-0">Lamy Store</h6>
        </div>
        <div class="main-detail-head-policy">
          <div class="mb-3"><b>Chính sách bán hàng</b></div>
          <ul class="ps-0">
            <li class="d-flex"><img src="/template/img/ship.webp" alt=""><span class="ms-3">Miễn phí giao hàng cho đơn hàng
                từ 800.000đ</span></li>
            <li class="d-flex"><img src="/template/img/shield.webp" alt=""><span class="ms-3">Cam kết hàng giống ảnh
              </span></li>
            <li class="d-flex"><img src="/template/img/trans.webp" alt=""><span class="ms-3">Đổi trả trong vòng 10 ngày
              </span></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="main-detail-description ">
      <h4>Mô tả sản phẩm</h4>
      <div>
        {!! $product->content !!}
      </div>
    </div>
    <div class="modal fade" id="addToCartModal" tabindex="-1" aria-labelledby="addToCartModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addToCartModalLabel">Thông báo</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" onclick="location.reload();"></button>
          </div>
          <div class="modal-body text-center">
            <img src="/template/img/tich.jpg" alt="tich" width="30%">
            <p>Sản phẩm đã được thêm vào giỏ hàng!</p>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="location.reload();">Đóng</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
@endsection
