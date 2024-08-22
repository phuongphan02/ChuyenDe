<?php

namespace App\Helpers\Order;

use Illuminate\Support\Str;

class OrderHelper
{

  public static function order($orders)
  {
    $html = '';
    foreach ($orders as $key => $order) {
      $userSet = ($order->userset_id == NULL) ? '' : ($order->userSet->name . ' (' . $order->userSet->usertype->name . ')');
      $userShip = ($order->user_id == NULL) ? '' : ($order->user->name);
      $statusClass = '';
      switch ($order->status_id) {
        case 1:
          $statusClass = 'wait';
          break;
        case 2:
          $statusClass = 'confirm';
          break;
        case 3:
          $statusClass = 'shipping';
          break;
        case 4:
          $statusClass = 'delivered';
          break;
        case 5:
          $statusClass = 'cancel';
          break;
        default:
          $statusClass = 'null';
          break;
      }
      $html .= '
        <tr>
          <td>' . $order->id . '</td>
          <td>' . $order->customer->name . ' (' . $order->customer->phone . ')</td>
          <td>' . $userSet . ' </td>
          <td>' . $userShip . ' </td>
          <td><div class="main-order-'. $statusClass .'">' . $order->status->name . '</div></td>
          <td>' . date('d-m-Y H:i:s', strtotime($order->updated_at)) . '</td>
          <td>
          <div class="d-flex justify-content-center">
            <a href="/admin/orders/edit/id=' . $order->id . '" class="btn btn-primary btn-sm">
              <i class="fa-solid fa-eye"></i>
            </a>
            </div>
           </td>
        </tr>
        ';

      unset($orders[$key]);
    }

    return $html;
  }
}
