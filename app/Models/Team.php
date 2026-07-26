<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Team extends Model
{
    protected $fillable = ['name','created_by'];

    public function users() {
        return $this->hasMany(User::class, 'team_id');
    }

    public function tasks() {
        return $this->hasMany(Task::class, 'team_id');
    }
}
