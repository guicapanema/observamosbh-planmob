<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Axis extends Model
{
	public function actions() {
		return $this->hasManyThrough(Action::class, Program::class);
	}
	public function indicators() {
		return $this->morphMany(Indicator::class, 'parent');
	}
    public function programs() {
		return $this->hasMany(Program::class);
	}
}
