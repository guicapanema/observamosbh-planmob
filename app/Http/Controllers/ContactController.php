<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Mail;

class ContactController extends Controller
{

	public function contact(Request $request) {
		Mail::raw(request('mensagem'), function($message) {
		$message->from(request('email'), 'Formulário de contato mobilidadebh.org');

		$message->to('guilherme@capanema.me');
		});
		return view('contato');
	}
}
