<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class IndicatorData extends Model
{
	public function indicator() {
		return $this->belongsTo(Indicator::class);
	}
}
