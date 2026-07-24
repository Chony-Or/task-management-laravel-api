<?php

namespace App\Http\Controllers;
use app\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    public function index()
    {
        return response()->json(User::all());
    }
}
