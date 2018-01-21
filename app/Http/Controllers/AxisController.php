<?php

namespace App\Http\Controllers;

use App\Axis;
use Illuminate\Http\Request;

class AxisController extends Controller
{
	public function list() {
		$axes = Axis::all();
		return $axes;
	}
}
