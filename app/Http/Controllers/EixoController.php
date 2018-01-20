<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EixoController extends Controller
{
    public function list() {
		return DB::table('eixos')->get();
	}
}
