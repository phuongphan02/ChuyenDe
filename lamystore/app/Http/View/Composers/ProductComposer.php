<?php

namespace App\Http\View\Composers;

use App\Models\Product;
use App\Repositories\UserRepository;
use Illuminate\Pagination\Paginator;
use Illuminate\View\View;

class ProductComposer
{
  protected $users;

  public function __construct()
  {
  }

  public function compose(View $view): void
  {
    $products = Product::with('producttype', 'promotion', 'trademark')
      ->select('products.*')
      ->join('product_types', 'product_types.id', '=', 'products.producttype_id')
      ->join('trademarks', 'trademarks.id', '=', 'products.trademark_id')
      ->join('promotions', 'promotions.id', '=', 'products.promotion_id')
      ->orderByDesc('id');

    $search = request()->input('search');
    if (!empty($search)) {
      $products->where(function ($query) use ($search) {
        $query->where('products.name', 'like', '%' . $search . '%')
          ->orWhere('product_types.name', 'like', '%' . $search . '%')
          ->orWhere('trademarks.name', 'like', '%' . $search . '%');
      });
    }

    $productTypeId = request()->input('producttype_id');
    $trademarkId = request()->input('trademark_id');

    if (!empty($productTypeId)) {
      $products->where('products.producttype_id', $productTypeId);
    }

    if (!empty($trademarkId)) {
      $products->where('products.trademark_id', $trademarkId);
    }

    $products = $products->paginate(24);
    $products->appends(['search' => $search, 'producttype_id' => $productTypeId, 'trademark_id' => $trademarkId]);

    $view->with('products', $products);
  }
}
