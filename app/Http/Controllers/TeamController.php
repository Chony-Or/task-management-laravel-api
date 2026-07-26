<?php

namespace App\Http\Controllers;
use App\Models\Team;
use Illuminate\Http\Request;

class TeamController extends Controller
{
    public function index() {
        return Team::with('users')->get();
    }

    public function store(Request $request) {
        $user = $request->user();
        $validated = $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $team = Team::create([
            'name' => $validated['name'],
            'created_by' => $user->id,
        ]);

        return response()->json($team, 201);
    }
}
