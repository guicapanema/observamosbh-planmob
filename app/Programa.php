<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Programa extends Model
{
	public function programas() {
		return $this->hasMany(Acao::class);
	}
	public function eixo() {
		return $this->belongsTo(Eixo::class);
	}
}
