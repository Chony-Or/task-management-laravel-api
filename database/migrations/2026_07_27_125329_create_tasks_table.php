<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('tasks', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('title');
            $table->text('description')->nullable();
            $table->enum('status', ['pending', 'in_progress', 'completed', 'cancelled'])->default('pending');
            $table->unsignedBigInteger('assigned_to')->index('tasks_assigned_to_foreign');
            $table->unsignedBigInteger('created_by')->index('tasks_created_by_foreign');
            $table->enum('priority', ['low', 'medium', 'high'])->default('medium');
            $table->dateTime('due_date')->nullable();
            $table->unsignedBigInteger('team_id')->index('tasks_team_id_foreign');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('tasks');
    }
};
