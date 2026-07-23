<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class UserSeeder extends Seeder
{
    public function run(): void
    {
        User::create([
            'name' => 'Admin User',
            'email' => 'admin@test.com',
            'password' => bcrypt('password123'),
            'role' => 'admin',
            'is_active' => true,
        ]);

        User::create([
            'name' => 'Manager User',
            'email' => 'manager@test.com',
            'password' => bcrypt('password123'),
            'role' => 'manager',
            'is_active' => true,
        ]);

        User::create([
            'name' => 'Team Member',
            'email' => 'member@test.com',
            'password' => bcrypt('password123'),
            'role' => 'team_member',
            'is_active' => true,
        ]);
    }
}
