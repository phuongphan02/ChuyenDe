<?php

namespace App\Providers;

use App\Http\View\Composers\CartComposer;
use App\Http\View\Composers\MenuComposer;
use App\Http\View\Composers\OrderComposer;
use App\Http\View\Composers\ProductComposer;
use App\Http\View\Composers\ProductHomeComposer;
use App\Http\View\Composers\ProductTypeComposer;
use App\Http\View\Composers\ProductTypePComposer;
use App\Http\View\Composers\SaleComposer;
use App\Http\View\Composers\SliderComposer;
use App\Http\View\Composers\TrademarkComposer;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class ViewServiceProvider extends ServiceProvider
{
  /**
   * Register services.
   */
  public function register(): void
  {
    //
  }

  /**
   * Bootstrap services.
   */
  public function boot(): void
  {
    View::composer('layout.header',MenuComposer::class);
    View::composer('home',SliderComposer::class);
    View::composer('home',ProductTypeComposer::class);
    View::composer('home',TrademarkComposer::class);
    View::composer('home',ProductHomeComposer::class);
    View::composer('product',ProductComposer::class);
    View::composer('product',ProductTypePComposer::class);
    View::composer('product',TrademarkComposer::class);
    View::composer('sale',SaleComposer::class);
    View::composer('order',OrderComposer::class);
    View::composer('layout.cart',CartComposer::class);
  }
}
