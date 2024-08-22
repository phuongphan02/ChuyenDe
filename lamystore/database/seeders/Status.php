<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class Status extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('statuses')->insert([
            [
                'name' => 'Chờ xác nhận',
            ],
            [
                'name' => 'Xác nhận thành công',
            ],
            [
                'name' => 'Đang giao hàng',
            ],
            [
                'name' => 'Giao hàng thành công',
            ],
            [
                'name' => 'Huỷ đơn hàng',
            ],
        ]);
    }
}
