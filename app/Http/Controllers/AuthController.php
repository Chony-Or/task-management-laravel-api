<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\User;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8',
        ]);

        
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'role' => 'team_member',
            'is_active' => true,
        ]);

        return response()->json([
            'token' =>$user->createToken('api')->plainTextToken
        ]);
    }

    public function login(Request $request)
    {
        // validate input
        $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        // check credentials
        if (!Auth::attempt($request->only('email', 'password'))) {
            return response()->json(['error' => 'Invalid credentials'], 401);
        }

        // get authenticated user
        $user = Auth::user();

        // return token
        return response()->json([
            'token' => $user->createToken('api')->plainTextToken
        ]);
    }
}
