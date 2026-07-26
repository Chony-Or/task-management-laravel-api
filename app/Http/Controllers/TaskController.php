<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Task;

class TaskController extends Controller
{
    // List tasks for a team
    public function teamTasks(Request $request, $team_id)
    {
        $user = $request->user();

        if (in_array($user->role, ['admin','manager'])) {
            return Task::with(['assignedUser','creator'])
                       ->where('team_id', $team_id)
                       ->get();
        }

        return Task::with(['assignedUser','creator'])
                   ->where('team_id', $team_id)
                   ->where('assigned_to', $user->id)
                   ->get();
    }

    // Create task
    public function store(Request $request, $team_id)
    {
        $user = $request->user();

        $validated = $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'priority' => 'required|in:low,medium,high',
            'due_date' => 'nullable|date',
            'assigned_to' => 'required|exists:users,id',
        ]);

        $task = Task::create([
            'title' => $validated['title'],
            'description' => $validated['description'] ?? null,
            'status' => 'pending',
            'priority' => $validated['priority'],
            'due_date' => $validated['due_date'] ?? null,
            'assigned_to' => $validated['assigned_to'],
            'created_by' => $user->id,
            'team_id' => $team_id,
        ]);

        return response()->json($task, 201);
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
        $user = $request->user();

        if ($user->role === 'team_member' && $task->assigned_to !== $user->id) {
            return response()->json(['error' => 'Unauthorized'], 403);
        }

        $validated = $request->validate([
            'title' => 'sometimes|string|max:255',
            'description' => 'nullable|string',
            'priority' => 'sometimes|in:low,medium,high',
            'due_date' => 'nullable|date',
            'assigned_to' => 'nullable|exists:users,id',
        ]);

        $task->update($validated);

        return response()->json($task);
    }

    // Delete task
    public function destroy(Request $request, $id)
    {
        $task = Task::findOrFail($id);
        $user = $request->user();

        if ($user->role === 'admin' || $task->created_by === $user->id) {
            $task->delete();
            return response()->json(['message' => 'Task deleted']);
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

        return response()->json($task);
    }
}
