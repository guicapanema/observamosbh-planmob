<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Data extends Model
{
	/**
     * The attributes that aren't mass assignable.
     *
     * @var array
     */
    protected $guarded = [];

	public function datable()
    {
        return $this->morphTo();
    }

	public function getValueAttribute($value)
    {
		if ($this->datable->unit === '%') {
			return $value * 100;
		}

        return $value;
    }
}
