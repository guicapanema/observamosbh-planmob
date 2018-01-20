<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Acao extends Model
{
	public function programa() {
		return $this->belongsTo(Programa::class);
	}
}
