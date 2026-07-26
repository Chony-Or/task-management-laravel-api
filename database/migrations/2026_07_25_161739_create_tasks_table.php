<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->id();
            $table->string('title');
            $table->text('description')->nullable();
            $table->enum('status', ['pending','in_progress','completed','cancelled'])->default('pending');
            $table->unsignedBigInteger('assigned_to');   // FK → users
            $table->unsignedBigInteger('created_by');    // FK → users
            $table->enum('priority', ['low','medium','high'])->default('medium');
            $table->dateTime('due_date')->nullable();
            $table->unsignedBigInteger('team_id');       // FK → teams
            $table->timestamps();

            // Foreign keys
            $table->foreign('assigned_to')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('created_by')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('team_id')->references('id')->on('teams')->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('tasks');
    }
};
