<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Eixo extends Model
{
	public function programas() {
		return $this->hasMany(Programa::class);
	}
}
