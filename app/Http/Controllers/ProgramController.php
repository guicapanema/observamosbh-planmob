<?php

namespace App\Http\Controllers;

use App\Program;
use Illuminate\Http\Request;

class ProgramController extends Controller
{
	public function list() {
		$programs = Program::with(['actions', 'indicators'])->get();
		return $programs;
	}
}
