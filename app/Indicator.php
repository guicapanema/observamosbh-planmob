<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Indicator extends Model
{
    public function parent() {
		return $this->morphTo();
	}

	public function data() {
		return $this->hasMany(IndicatorData::class);
	}
}
