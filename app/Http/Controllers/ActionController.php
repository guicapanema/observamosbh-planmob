<?php

namespace App\Http\Controllers;

use App\Action;
use Illuminate\Http\Request;

class ActionController extends Controller
{
	public function list() {
		$actions = Action::all();
		return $actions;
	}
}
