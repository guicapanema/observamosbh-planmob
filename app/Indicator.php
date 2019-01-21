<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Indicator extends Model
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

	public function parent() {
		return $this->morphTo();
	}

	public function references() {
		return $this->hasMany(Reference::class);
	}

	public function getTargetShortAttribute($target_short)
    {
		if ( ($this->unit === '%') && is_numeric($target_short) ) {
			return $target_short * 100;
		}

        return $target_short;
    }

	public function getTargetMediumAttribute($target_medium)
    {
		if ( ($this->unit === '%') && is_numeric($target_medium) ) {
			return $target_medium * 100;
		}

        return $target_medium;
    }

	public function getTargetLongAttribute($target_long)
    {
		if ( ($this->unit === '%') && is_numeric($target_long) ) {
			return $target_long * 100;
		}

        return $target_long;
    }
}
