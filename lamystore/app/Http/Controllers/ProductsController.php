<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductType;
use App\Models\Promotion;
use App\Models\Trademark;
use Illuminate\Http\Request;

class ProductsController extends Controller
{
  public function index()
  {
    return view('product', [
      'title' => 'Sản phẩm',
    ]);
  }

  public function show(Product $product)
  {
    $trademarks = Trademark::all();
    $producttypes = ProductType::all();
    $promotions = Promotion::all();
    return view('detail', [
      'title' => $product->name,
      'product' => $product,
      'producttypes' => $producttypes,
      'trademarks' => $trademarks,
      'promotions' => $promotions,
    ]);
  }
}
