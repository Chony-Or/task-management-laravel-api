<?php

namespace App\Http\Controllers;
use app\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index()
    {
        $users = User::with('team')->get();
        return response()->json($users);
    }

    public function store(Request $request)
    {
         $authUser = $request->user();

        // Only Admin can add new members
        if ($authUser->role !== 'admin') {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:8',
            'role' => 'required|string',
            'team_id' => 'nullable|exists:teams,id',
        ]);

        $user = User::create([
            'name' => $validated['name'],
            'email' => $validated['email'],
            'password' => bcrypt($validated['password']),
            'role' => $validated['role'],
            'team_id' => $validated['team_id'] ?? null,
        ]);

        // reload with team relationship
        $user->load('team');

        return response()->json($user, 201);
    }
       public function update(Request $request, $id)
    {
        $authUser = $request->user();
        if ($authUser->role !== 'admin') {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users,email,'.$id,
            'role' => 'required|string',
            'team_id' => 'nullable|exists:teams,id',
        ]);

        $user = User::findOrFail($id);
        $user->update($validated);

        $user->load('team');

        return response()->json($user);
    }

    public function toggleActive(Request $request, $id)
    {
        $authUser = $request->user();
        if ($authUser->role !== 'admin') {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        $user = User::findOrFail($id);
        $user->is_active = !$user->is_active;
        $user->save();

        return response()->json($user);
    }
}
