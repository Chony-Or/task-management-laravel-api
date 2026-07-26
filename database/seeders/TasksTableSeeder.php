<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TasksTableSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('tasks')->insert([
            ['title' => 'Buy groceries', 'created_at' => now(), 'updated_at' => now()],
            ['title' => 'Finish project report', 'created_at' => now(), 'updated_at' => now()],
            ['title' => 'Call the client', 'created_at' => now(), 'updated_at' => now()],
        ]);
    }
}
