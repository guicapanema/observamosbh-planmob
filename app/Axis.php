<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Axis extends Model
{
    public function programs() {
		return $this->hasMany(Program::class);
	}
}
