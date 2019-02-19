<?php

namespace App\Http\Controllers;

use App\Metric;
use Illuminate\Http\Request;

class MetricController extends Controller
{
	public function list() {
		$references = Metric::with('data')->whereHas('data')->orderBy('name')->get();
		return $references;
	}
}
