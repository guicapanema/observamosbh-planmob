<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Metric extends Model
{
	/**
	 * The attributes that aren't mass assignable.
	 *
	 * @var array
	 */
	protected $guarded = [];

	public function data() {
		return $this->morphMany(Data::class, 'datable');
	}
}
