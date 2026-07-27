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
        Schema::table('tasks', function (Blueprint $table) {
            $table->foreign(['assigned_to'])->references(['id'])->on('users')->onUpdate('restrict')->onDelete('cascade');
            $table->foreign(['created_by'])->references(['id'])->on('users')->onUpdate('restrict')->onDelete('cascade');
            $table->foreign(['team_id'])->references(['id'])->on('teams')->onUpdate('restrict')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('tasks', function (Blueprint $table) {
            $table->dropForeign('tasks_assigned_to_foreign');
            $table->dropForeign('tasks_created_by_foreign');
            $table->dropForeign('tasks_team_id_foreign');
        });
    }
};
