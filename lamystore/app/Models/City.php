<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class City extends Model
{
  use HasFactory;

  protected $fillable = [
    'name',
    'type',
    'province_id',
  ];

  public function customers()
  {
    return $this->hasMany(Customer::class);
  }

  public function province()
  {
    return $this->belongsTo(Province::class);
  }
}
