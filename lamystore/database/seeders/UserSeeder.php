<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
  /**
   * Run the database seeds.
   */
  public function run(): void
  {
    DB::table('users')->insert([
      [
        'name' => 'Thu Phương',
        'gender' => 1,
        'cccd' => '056221009724',
        'phone' => '0362372125',
        'email' => 'admin@localhost.com',
        'thumb' => '/storage/uploads/admin/avatar.jpg',
        'email_verified_at' => now(),
        'password' => Hash::make('123456'),
      ]
    ]);
  }
}
