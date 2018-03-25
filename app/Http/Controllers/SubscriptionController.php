<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Subscription;


class SubscriptionController extends Controller
{
	public function store(Request $request) {

		$this->validate(request(), [
			'name' => 'required|string|max:255',
			'email' => 'required|string|email|max:255|unique:subscriptions',
			'news' => 'boolean'
		]);

		Subscription::create([
				'name' => request('name'),
				'email' => request('email'),
				'news'	=>	request('news') ? true : false
			]);

		$request->session()->flash('success', 'Cadastro realizado com sucesso!');
		return view('participe');
	}
}
