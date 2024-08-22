<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Customer;
use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ContactController extends Controller
{
  public function adminChat()
  {
    $customers = Customer::where('status', 1)
      ->where(function ($query) {
        $query->whereExists(function ($subquery) {
          $subquery->selectRaw('1')
            ->from('messages')
            ->whereRaw('messages.sender = "admin"')
            ->whereRaw('messages.recipient = customers.id');
        })->orWhereExists(function ($subquery) {
          $subquery->selectRaw('1')
            ->from('messages')
            ->whereRaw('messages.sender = customers.id')
            ->whereRaw('messages.recipient = "admin"');
        });
      })
      ->orderByDesc(function ($query) {
        $query->selectRaw('MAX(messages.created_at)')
          ->from('messages')
          ->where(function ($subquery) {
            $subquery->whereRaw('messages.sender = "admin"')
              ->whereRaw('messages.recipient = customers.id');
          })->orWhere(function ($subquery) {
          $subquery->whereRaw('messages.sender = customers.id')
            ->whereRaw('messages.recipient = "admin"');
        });
      })
      ->select('customers.*')
      ->selectRaw('(SELECT COUNT(*) FROM messages WHERE sender = customers.id AND recipient = "admin" AND `read` = 1) AS unreadCount')
      ->get();
    return view('admin.contact.list', [
      'title' => 'Hỗ trợ khách hàng'
    ], compact('customers'));
  }

  public function getMessages($customerId)
  {
    // Lấy tin nhắn từ cơ sở dữ liệu cho cặp admin và customer hiện tại
    $messages = Message::where(function ($query) use ($customerId) {
      $query->where('sender', 'admin')
        ->where('recipient', $customerId);
    })->orWhere(function ($query) use ($customerId) {
      $query->where('sender', $customerId)
        ->where('recipient', 'admin');
    })->get();

    foreach ($messages as $message) {
      if ($message->read == 1) {
        $message->read = 0;
        $message->save();
      }
    }

    return response()->json(['messages' => $messages]);
  }
  public function adminSendMessage(Request $request)
  {
    $customerId = $request->input('customerId');
    $messageContent = $request->input('message');

    // Lưu tin nhắn vào cơ sở dữ liệu
    $message = new Message();
    $message->sender = 'admin';
    $message->recipient = $customerId;
    $message->message = $messageContent;
    $message->read = 0;
    $message->save();

    // Các mã khác để gửi tin nhắn cho customer

    return response()->json(['success' => true]);
  }

  public function unread($customerId)
  {
    $unreadCount = Message::where('sender', $customerId)
      ->where('recipient', 'admin')
      ->where('read', 1)
      ->count();
    return response()->json([
      'success' => true,
      'unreadCount' => $unreadCount
    ]);
  }

  public function getUnreadMessageCounts()
  {
    $unreadCounts = [];

    // Lấy số tin nhắn chưa đọc cho mỗi khách hàng
    $customers = Customer::all();
    foreach ($customers as $customer) {
      $unreadCount = Message::where('sender', $customer->id)
        ->where('recipient', 'admin')
        ->where('read', 1)
        ->count();
      $unreadCounts[$customer->id] = $unreadCount;
    }

    return response()->json(['unreadCounts' => $unreadCounts]);
  }

  public function markMessageAsRead(Request $request)
  {
    $customerId = $request->input('customerId');
    Message::where('sender', $customerId)
      ->where('recipient', 'admin')
      ->where('read', 1)
      ->update(['read' => 0]);

    return response()->json(['success' => true]);
  }

  public function getCustomerList()
  {
    $customers = Customer::where('status', 1)
      ->where(function ($query) {
        $query->whereExists(function ($subquery) {
          $subquery->selectRaw('1')
            ->from('messages')
            ->whereRaw('messages.sender = "admin"')
            ->whereRaw('messages.recipient = customers.id');
        })->orWhereExists(function ($subquery) {
          $subquery->selectRaw('1')
            ->from('messages')
            ->whereRaw('messages.sender = customers.id')
            ->whereRaw('messages.recipient = "admin"');
        });
      })
      ->orderByDesc(function ($query) {
        $query->selectRaw('MAX(messages.created_at)')
          ->from('messages')
          ->where(function ($subquery) {
            $subquery->whereRaw('messages.sender = "admin"')
              ->whereRaw('messages.recipient = customers.id');
          })->orWhere(function ($subquery) {
          $subquery->whereRaw('messages.sender = customers.id')
            ->whereRaw('messages.recipient = "admin"');
        });
      })
      ->select('customers.*')
      ->selectRaw('(SELECT COUNT(*) FROM messages WHERE sender = customers.id AND recipient = "admin" AND `read` = 1) AS unreadCount')
      ->get();

    return response()->json(['customers' => $customers]);
  }
}