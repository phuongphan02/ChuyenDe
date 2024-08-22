<?php

namespace App\Http\Controllers;

use App\HTTP\Services\Contact\ContactService;
use App\Models\Customer;
use App\Models\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ChatController extends Controller
{
  protected $contactService;
  /**
   * Display a listing of the resource.
   */
  public function __construct(ContactService $contactService)
  {
    $this->middleware('cus');
    $this->contactService = $contactService;
  }

  public function customerChat(Request $request)
  {
    $customerId = Auth::guard('cus')->user()->id;
    $customer = Customer::find($customerId);
    $messages = Message::where('sender', 'admin')
      ->where('recipient', $customerId)
      ->orWhere(function ($query) use ($customerId) {
        $query->where('sender', $customerId)
          ->where('recipient', 'admin');
      })
    ->get();
    return view('chat', [
      'title' => 'Liên hệ',
      'messages' => $messages,
      'customer' => $customer
    ]);
  }

  public function customerSendMessage(Request $request)
  {
    $customerId = $request->input('customerId');
    $messageContent = $request->input('message');

    // Lưu tin nhắn vào cơ sở dữ liệu
    $message = new Message();
    $message->sender = $customerId;
    $message->recipient = 'admin';
    $message->message = $messageContent;
    $message->read = 1;
    $message->save();

    // Các mã khác để gửi tin nhắn cho admin

    return response()->json(['success' => true]);
  }
}
