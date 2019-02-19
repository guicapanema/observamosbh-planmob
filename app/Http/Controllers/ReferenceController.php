<?php

namespace App\Http\Controllers;

use App\Reference;
use Illuminate\Http\Request;

class ReferenceController extends Controller
{
	public function list() {
		$references = Reference::with('data')->whereHas('data')->orderBy('name')->get();
		return $references;
	}
}
