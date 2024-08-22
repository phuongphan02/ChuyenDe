<?php

namespace App\Mail;

use App\Models\Customer;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class VerifyEmail extends Mailable
{
  use Queueable, SerializesModels;

  public $customer;

  public function __construct(Customer $customer)
  {
    $this->customer = $customer;
  }

  public function build()
  {
    return $this->view('emails.verification')
      ->subject('Xác nhận địa chỉ email');
  }
}
