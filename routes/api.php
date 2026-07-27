<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\TaskController;
use App\Http\Controllers\TeamController;

// Authentication
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);

// Logged-in user info
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// Protected routes
Route::middleware('auth:sanctum')->group(function () {

    // Users
    Route::get('/users', [UserController::class, 'index']);
    Route::post('/users', [UserController::class, 'store']); // admin only
    Route::put('/users/{id}', [UserController::class, 'update']);
    Route::patch('/users/{id}/toggle-active', [UserController::class, 'toggleActive']);

    // Tasks
    Route::get('/member/tasks', [TaskController::class, 'memberTasks']);   // member-only
    Route::get('/admin/tasks', [TaskController::class, 'allTasks']);       // admin/manager
    Route::get('/teams/{team_id}/tasks', [TaskController::class, 'teamTasks']); // team-specific

    Route::post('/tasks', [TaskController::class, 'store']);               // create
    Route::get('/tasks/{id}', [TaskController::class, 'show']);            // view single
    Route::patch('/tasks/{id}', [TaskController::class, 'update']);        // update all fields
    Route::patch('/tasks/{id}/status', [TaskController::class, 'updateStatus']); // update status
    Route::delete('/tasks/{id}', [TaskController::class, 'destroy']);      // hard delete

    // Teams
    Route::get('/teams', [TeamController::class, 'index']);
    Route::post('/teams', [TeamController::class, 'store']);
});
