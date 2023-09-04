<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Models\ProductComment;
use App\Models\User;
use Illuminate\Http\Request;

class ProductCommentController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $com =ProductComment::all();
        $product = Product::all();
        $user = User::all();
        $com = ProductComment::paginate(10);
        return view('comment.index',compact('com','product','user'));


    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $com = ProductComment::findOrFail($id);

        // Xóa banner
        $com->delete();
        return redirect()->route('comments')->with('success', 'Delete Comments Successfully!');
    }
}
