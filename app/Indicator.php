<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Indicator extends Model
{
	public function data() {
		return $this->morphMany(Data::class, 'datable');
	}

	public function parent() {
		return $this->morphTo();
	}

	public function references() {
		return $this->hasMany(Reference::class);
	}
}
