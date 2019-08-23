<?php

namespace App\Http\Controllers;

use Corcel\Model\Post as Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::published()->paginate(5);

        return view('como-anda', compact('posts'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Post  $news
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $post_name)
    {
        $post = Post::where('post_name', $post_name)->first();

        if ($post === null) abort(404);

        $posts = array($post);

        return view('como-anda', compact('posts'));
    }
}
