<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reference extends Model
{
	public function data() {
		return $this->morphMany(Data::class, 'datable');
	}

	public function indicator() {
		return $this->belongsTo(Indicator::class);
	}
}