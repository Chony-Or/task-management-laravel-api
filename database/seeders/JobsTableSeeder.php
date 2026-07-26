<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class JobsTableSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('jobs')->insert([
            [
                'queue' => 'default',
                'payload' => json_encode(['task' => 'Send welcome email']),
                'attempts' => 0,
                'reserved_at' => null,
                'available_at' => time(),
                'created_at' => time(),
            ],
            [
                'queue' => 'default',
                'payload' => json_encode(['task' => 'Generate report']),
                'attempts' => 0,
                'reserved_at' => null,
                'available_at' => time(),
                'created_at' => time(),
            ],
            [
                'queue' => 'notifications',
                'payload' => json_encode(['task' => 'Push notification to user']),
                'attempts' => 1,
                'reserved_at' => null,
                'available_at' => time(),
                'created_at' => time(),
            ],
        ]);
    }
}
