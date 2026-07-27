<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Task;

class TaskController extends Controller
{
    // List tasks for a team
    public function allTasks(Request $request)
    {
        $user = $request->user();

        if (!in_array($user->role, ['admin','manager'])) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        return Task::with(['assignedUser','creator','team'])->get();
    }

    public function teamTasks(Request $request, $team_id)
    {
        $user = $request->user();

        if (!in_array($user->role, ['admin','manager'])) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        return Task::with(['assignedUser','creator','team'])
                ->where('team_id', $team_id)
                ->get();
    }


    // TaskController.php
    public function memberTasks(Request $request)
    {
        $user = $request->user();

        return Task::with(['assignedUser','creator','team'])
                ->where('assigned_to', $user->id)   
                ->get();
    }



    // Create task
    public function store(Request $request, $team_id = null)
    {
        $user = $request->user();

        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'priority' => 'required|in:low,medium,high',
            'due_date' => 'nullable|date',
            'assigned_to' => 'nullable|exists:users,id',
        ]);

        // If assigned_to is provided, fetch that user's team_id
        $assignedTeamId = null;
        if (!empty($validated['assigned_to'])) {
            $assignedUser = \App\Models\User::query()
                ->whereKey($validated['assigned_to'])
                ->first();
            $assignedTeamId = $assignedUser?->team_id;
        }

        $task = Task::create([
            'title' => $validated['title'],
            'description' => $validated['description'] ?? null,
            'status' => 'pending',
            'priority' => $validated['priority'],
            'due_date' => $validated['due_date'] ?? null,
            'assigned_to' => $validated['assigned_to'] ?? null,
            'created_by' => $user->id,
            'team_id' => $assignedTeamId,
        ]);

        return response()->json($task->load(['assignedUser','creator','team']), 201);
    }


    // Show task details
    public function show($id)
    {
        return Task::with(['assignedUser','creator','team'])->findOrFail($id);
    }

    // Update task
    public function update(Request $request, $id)
    {
        $task = Task::findOrFail($id);

        $validated = $request->validate([
            'title' => 'sometimes|string|max:255',
            'description' => 'nullable|string',
            'priority' => 'sometimes|in:low,medium,high',
            'due_date' => 'nullable|date',
            'assigned_to' => 'nullable|exists:users,id',
            'status' => 'sometimes|in:pending,in_progress,completed,cancelled',
        ]);

        // Update team_id if assigned_to changes
        if (array_key_exists('assigned_to', $validated)) {
            if ($validated['assigned_to']) {
                $assignedUser = \App\Models\User::whereKey($validated['assigned_to'])->first();
                $validated['team_id'] = $assignedUser?->team_id;
            } else {
                $validated['team_id'] = null;
            }
        }

        $task->update($validated);

        return response()->json($task->load(['assignedUser','creator','team']));
    }



    // Soft delete task (set status to cancelled)
    public function destroy(Request $request, $id)
    {
        $task = Task::findOrFail($id);
        $user = $request->user();

        if ($user->role === 'admin' || $task->created_by === $user->id) {
            $task->status = 'cancelled';
            $task->save();
            return response()->json($task->load(['assignedUser','creator','team']));
        }

        return response()->json(['error' => 'Unauthorized'], 403);
    }

    // Update status with transition rules
    public function updateStatus(Request $request, $id)
    {
        $task = Task::findOrFail($id);
        $validated = $request->validate([
            'status' => 'required|in:pending,in_progress,completed,cancelled',
        ]);

        $current = $task->status;
        $next = $validated['status'];

        $validTransitions = [
            'pending' => ['in_progress','cancelled'],
            'in_progress' => ['completed','pending'],
            'completed' => [],
            'cancelled' => [],
        ];

        if (!in_array($next, $validTransitions[$current])) {
            return response()->json(['error' => 'Invalid status transition'], 422);
        }

        $task->status = $next;
        $task->save();

        return response()->json($task->load(['assignedUser','creator','team']));
    }
}
