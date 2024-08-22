<?php

use App\Http\Controllers\Admin\ContactController;
use App\Http\Controllers\Admin\CustomerController;
use App\Http\Controllers\Admin\MainController;
use App\Http\Controllers\Admin\MenuController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\ProductTypeController;
use App\Http\Controllers\Admin\PromotionController;
use App\Http\Controllers\Admin\SaleController;
use App\Http\Controllers\Admin\SliderController;
use App\Http\Controllers\Admin\TrademarkController;
use App\Http\Controllers\Admin\UploadController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\Users\LoginController;
use App\Http\Controllers\Admin\UserTypeController;
use App\Http\Controllers\CartController;
use App\Http\Controllers\ChatController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OrdersController;
use App\Http\Controllers\ProductsController;
use App\Http\Controllers\SalesController;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

Auth::routes();

Route::fallback(function () {
  return view('errors.404');
});

Route::get('admin/login', [LoginController::class, 'index'])->name('admin.login');

Route::post('admin/login/store', [LoginController::class, 'store']);

Route::get('admin/logout', [LoginController::class, 'logout'])->name('admin.logout');

Route::middleware(['auth'])->group(function () {
  Route::prefix('admin')->group(function () {

    Route::get('/', [MainController::class, 'index'])->name('admin');
    Route::get('main', [MainController::class, 'index']);

    // Route::get('filter', [MainController::class, 'revenueByDay'])->name('sales.index');

    Route::get('info', [UserController::class, 'showInfoAdmin'])->name('admin.info');

    #Menu
    Route::prefix('menus')->group(function () {
      Route::get('add', [MenuController::class, 'create']);
      Route::post('add', [MenuController::class, 'store']);
      Route::get('list', [MenuController::class, 'index']);
      Route::get('edit/id={menu}', [MenuController::class, 'show']);
      Route::post('edit/id={menu}', [MenuController::class, 'update']);
      Route::delete('destroy', [MenuController::class, 'destroy']);
    });

    #Slider
    Route::prefix('sliders')->group(function () {
      Route::get('add', [SliderController::class, 'create']);
      Route::post('add', [SliderController::class, 'store']);
      Route::get('list', [SliderController::class, 'index']);
      Route::get('edit/id={slider}', [SliderController::class, 'show']);
      Route::post('edit/id={slider}', [SliderController::class, 'update']);
      Route::delete('destroy', [SliderController::class, 'destroy']);
    });

    #User
    Route::prefix('users')->group(function () {
      Route::get('add', [UserController::class, 'create']);
      Route::post('add', [UserController::class, 'store']);
      Route::get('list', [UserController::class, 'index']);
      Route::get('search', [UserController::class, 'search'])->name('admin.users.search');
      Route::get('edit/id={user}', [UserController::class, 'show']);
      Route::post('edit/id={user}', [UserController::class, 'update']);
      Route::delete('destroy', [UserController::class, 'destroy']);
    });


    #Trademark
    Route::prefix('trademarks')->group(function () {
      Route::get('add', [TrademarkController::class, 'create']);
      Route::post('add', [TrademarkController::class, 'store']);
      Route::get('list', [TrademarkController::class, 'index']);
      Route::get('search', [TrademarkController::class, 'search'])->name('admin.trademarks.search');
      Route::get('edit/id={trademark}', [TrademarkController::class, 'show']);
      Route::post('edit/id={trademark}', [TrademarkController::class, 'update']);
      Route::delete('destroy', [TrademarkController::class, 'destroy']);
    });

    #Sale
    Route::prefix('sales')->group(function () {
      Route::get('add', [SaleController::class, 'create']);
      Route::post('add', [SaleController::class, 'store']);
      Route::get('list', [SaleController::class, 'index']);
      Route::get('search', [SaleController::class, 'search'])->name('admin.sales.search');
      Route::get('edit/id={sale}', [SaleController::class, 'show']);
      Route::post('edit/id={sale}', [SaleController::class, 'update']);
      Route::delete('destroy', [SaleController::class, 'destroy']);
    });

    #Promotion
    Route::prefix('promotions')->group(function () {
      Route::get('add', [PromotionController::class, 'create']);
      Route::post('add', [PromotionController::class, 'store']);
      Route::get('list', [PromotionController::class, 'index']);
      Route::get('edit/id={promotion}', [PromotionController::class, 'show']);
      Route::post('edit/id={promotion}', [PromotionController::class, 'update']);
      Route::delete('destroy', [PromotionController::class, 'destroy']);
    });

    #PromductType
    Route::prefix('product_types')->group(function () {
      Route::get('add', [ProductTypeController::class, 'create']);
      Route::post('add', [ProductTypeController::class, 'store']);
      Route::get('list', [ProductTypeController::class, 'index']);
      Route::get('search', [ProductTypeController::class, 'search'])->name('admin.producttypes.search');
      Route::get('edit/id={product_type}', [ProductTypeController::class, 'show']);
      Route::post('edit/id={product_type}', [ProductTypeController::class, 'update']);
      Route::delete('destroy', [ProductTypeController::class, 'destroy']);
    });

    #Product
    Route::prefix('products')->group(function () {
      Route::get('add', [ProductController::class, 'create']);
      Route::post('add', [ProductController::class, 'store']);
      Route::get('list', [ProductController::class, 'index']);
      Route::get('search', [ProductController::class, 'search'])->name('admin.products.search');
      Route::get('edit/id={product}', [ProductController::class, 'show']);
      Route::post('edit/id={product}', [ProductController::class, 'update']);
      Route::delete('destroy', [ProductController::class, 'destroy']);
    });

    #Customer
    Route::prefix('customers')->group(function () {
      Route::get('add', [CustomerController::class, 'create']);
      Route::post('add', [CustomerController::class, 'store']);
      Route::get('list', [CustomerController::class, 'index']);
      Route::get('search', [CustomerController::class, 'search'])->name('admin.customers.search');
      Route::get('edit/id={customer}', [CustomerController::class, 'show']);
      Route::post('edit/id={customer}', [CustomerController::class, 'update']);
      Route::delete('destroy', [CustomerController::class, 'destroy']);
    });

    #Order
    Route::prefix('orders')->group(function () {
      Route::get('list', [OrderController::class, 'index']);
      Route::get('edit/id={order}', [OrderController::class, 'show']);
      Route::post('edit/id={order}', [OrderController::class, 'update']);
      Route::delete('destroy', [OrderController::class, 'destroy']);
    });

    #Contact
    Route::prefix('contacts')->group(function () {
      Route::get('list', [ContactController::class, 'adminChat']);
      Route::get('messages/{customerId}', [ContactController::class,'getMessages']);
      Route::post('send-message', [ContactController::class, 'adminSendMessage']);
      Route::get('unread/{customerId}', [ContactController::class, 'unread']);
      Route::get('get-customer-list', [ContactController::class,'getCustomerList']);
      Route::post('mark-message-as-read', [ContactController::class, 'markMessageAsRead']);
      Route::get('get-unread-message-counts', [ContactController::class, 'getUnreadMessageCounts']);
    });

    #Upload
    Route::post('upload/services', [UploadController::class, 'store']);
  });
});

Route::get('/', [HomeController::class, 'index'])->name('home');

// //Register
Route::get('register', [HomeController::class, 'register'])->name('home.register');
Route::post('register', [HomeController::class, 'post_register']);
Route::get('actived/{customer}/{token}', [HomeController::class, 'actived'])->name('home.actived');

// Login
Route::get('login', [HomeController::class, 'login'])->name('home.login');
Route::post('login', [HomeController::class, 'post_login']);

//logout
Route::get('logout', [HomeController::class, 'logout'])->name('home.logout');

//forget
Route::get('forget-password', [HomeController::class, 'forget'])->name('home.forget');
Route::post('forget-password', [HomeController::class, 'post_forget']);
Route::get('get-password/{customer}/{token}', [HomeController::class, 'getPass'])->name('home.getPass');
Route::post('get-password/{customer}/{token}', [HomeController::class, 'postGetPass']);

//Actived
Route::get('get-actived', [HomeController::class, 'getActived'])->name('home.getActived');
Route::post('get-actived', [HomeController::class, 'postGetActived']);

Route::get('test-email', [HomeController::class, 'testEmail']);

//info
Route::get('info', [HomeController::class, 'showInfo']);
Route::post('info', [HomeController::class, 'updateInfo']);

Route::get('product', [ProductsController::class, 'index']);
Route::get('product/id={product}', [ProductsController::class, 'show']);
Route::get('sale',[SalesController::class,'index']);
Route::get('ajax-search-product', [HomeController::class, 'ajaxSearch'])->name('ajax-search-product');
Route::get('order', [OrdersController::class, 'index']);
Route::post('addcart', [CartController::class, 'index']);
Route::get('carts', [CartController::class, 'show']);
Route::post('update-cart', [CartController::class, 'update']);
Route::delete('carts/{product_id}', [CartController::class, 'delete']);
Route::delete('carts/delete/all', [CartController::class, 'deleteALL']);
Route::post('checkSaleToken',[CartController::class, 'checkSaleToken'])->name('checkSaleToken');
Route::get('pay', [CartController::class, 'showPay']);
Route::post('addpay', [CartController::class, 'addOrder']);

Route::get('contact',[ChatController::class,'customerChat']);
Route::post('send-message',[ChatController::class,'customerSendMessage']);

