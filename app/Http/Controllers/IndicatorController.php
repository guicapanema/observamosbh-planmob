<?php

namespace App\Http\Controllers;

use App\Indicator;
use Illuminate\Http\Request;

class IndicatorController extends Controller
{
	public function list() {
		$indicators = Indicator::all();
		return $indicators;
	}
}
