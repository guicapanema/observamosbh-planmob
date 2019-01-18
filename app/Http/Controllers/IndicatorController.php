<?php

namespace App\Http\Controllers;

use App\Indicator;
use App\Exports\IndicatorExport;
use Illuminate\Http\Request;

class IndicatorController extends Controller
{
	public function export(Request $request, Indicator $indicator)
	{
		$file_name = $indicator->alias . '.csv';

		return ( new IndicatorExport($indicator) )->download($file_name);
	}

	public function list()
	{
		$indicators = Indicator::with('data')->get();
		return $indicators;
	}
}
