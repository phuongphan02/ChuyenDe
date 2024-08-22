<?php

namespace App\Helpers\Customer;
use Illuminate\Support\Str;

class CustomerHelper
{

  public static function customer($customers)
  {
    $html = '';
    foreach ($customers as $key => $customer) {
      $html .= '
        <tr>
          <td>' . $customer->id . '</td>
          <td>' . $customer->name . '</td>
          <td>' . $customer->phone . '</td>
          <td>' . $customer->address . '</td>
          <td>' . $customer->email . '</td>
          <td>' . self::active($customer->status) . '</td>
          <td>' . date('d-m-Y H:i:s', strtotime($customer->created_at)) . '</td>
          <td>
            <div class="d-flex justify-content-center">
            <a href="/admin/customers/edit/id=' . $customer->id . '" class="btn btn-primary btn-sm">
              <i class="fa-regular fa-pen-to-square"></i>
            </a>
            </div>

          </td>
        </tr>
        ';

      unset($customers[$key]);
    }

    return $html;
  }

  public static function active($active = 0)
  {
    return $active == 0 ? '<span class="btn btn-danger btn-sm"><i class="fa-solid fa-x"></i></span>' : '<span class="btn btn-success btn-sm"><i class="fa-regular fa-check"></i></span>';
  }
}
