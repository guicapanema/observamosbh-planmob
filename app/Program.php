<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Program extends Model
{
	public function actions() {
		return $this->hasMany(Action::class);
	}
	public function indicators() {
		return $this->morphMany(Indicator::class, 'parent');
	}
}
