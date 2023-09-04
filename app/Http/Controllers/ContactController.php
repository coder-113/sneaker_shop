<?php

namespace App\Http\Controllers;
use App\Models\Contact;
use App\Models\Category;
use App\Models\Brand;
use Illuminate\Http\Request;

class ContactController extends Controller
{

    public function __construct()
    {
        $this->middleware('auth');
    }
    public function saveMessage(Request $request)
    {
        $validatedData = $request->validate([
            'title' => 'required|max:255',
            'content' => 'required',
        ]);

        $validatedData['user_id'] = auth()->user()->id; // Lấy user_id của người dùng hiện tại

        Contact::create($validatedData);

        return redirect('/contact');
    }

    public function index()
    {
        $categories = Category::all();
        $brands = Brand::all();
        return view('fe.contact',compact('categories','brands'),['title' => 'Contact']);
    }
public function contactAdmin()
    {
        $contact = Contact::all();
        $contact = Contact::paginate(10);
        return view('contact.index',compact('contact'));
    }
   public function destroy($id)
    {
        $contact = Contact::findOrFail($id);
        $contact->delete();
        return redirect()->route('contact.admin')->with('success', 'Delete Success!');
    }
}
