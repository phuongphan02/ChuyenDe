<?php

namespace App\Http\Controllers;

use App\HTTP\Services\Order\OrderService;
use App\Models\Order;
use App\Models\Promotion;
use Illuminate\Http\Request;

class OrdersController extends Controller
{
  protected $orderService;
  /**
   * Display a listing of the resource.
   */
  public function __construct(OrderService $orderService)
  {
    $this->middleware('cus');
    $this->orderService = $orderService;
  }
  public function index()
  {
    return view('order', [
      'title' => 'Đơn hàng',
    ]);
  }
}
