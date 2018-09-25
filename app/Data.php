<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Data extends Model
{
	public function datable()
    {
        return $this->morphTo();
    }
}
