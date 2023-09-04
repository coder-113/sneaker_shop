<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Order;
use App\Models\User;
class ProfileController extends Controller
{
    public function index()
    {


        return view('profile');
    }
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function edit()
    { $orders = Order::all();
        $user = Auth::user();
        return view('fe.profile', compact('user','orders'));
    }

    public function update(Request $request)
    {
        $user = Auth::user();

      $request->validate([
            'name' => 'required|max:255',
            'last_name' => 'required|max:255',
            'email' => 'required|email|max:255',
            'avatar' => 'image|max:2048', // Assuming avatar is an image file
        ]);


        if ($request->hasFile('avatar')) {
            $file = $request->file('avatar');
            $extension = $file->getClientOriginalExtension();
            if (!in_array($extension, ['jpg', 'png', 'jpeg', 'avif', 'webp'])) {
                return redirect()->back()->withErrors('Định dạng hình ảnh không hợp lệ.');
            }
            $imageName = $file->getClientOriginalName();
            $file->move("images", $imageName);
        } else {
            $imageName = null;
        }

        $user = User::where('email', $request->email)->first();

        if ($user) {
            $user->name = $request->name;
            $user->last_name = $request->last_name;
            $user->avatar = $imageName;

            $user->save();
        } else {
            return redirect()->back()->withErrors('Người dùng không tồn tại.');
        }

        return redirect()->route('profilefe')->with('success', 'Profile updated successfully!');

    }
    public function updateadmin(Request $request)
    {
        $user = Auth::user();

      $request->validate([
            'name' => 'required|max:255',
            'last_name' => 'required|max:255',
            'email' => 'required|email|max:255',
            'avatar' => 'image|max:2048', // Assuming avatar is an image file
        ]);


        if ($request->hasFile('avatar')) {
            $file = $request->file('avatar');
            $extension = $file->getClientOriginalExtension();
            if (!in_array($extension, ['jpg', 'png', 'jpeg', 'avif', 'webp'])) {
                return redirect()->back()->withErrors('Định dạng hình ảnh không hợp lệ.');
            }
            $imageName = $file->getClientOriginalName();
            $file->move("images", $imageName);
        } else {
            $imageName = null;
        }

        $user = User::where('email', $request->email)->first();

        if ($user) {
            $user->name = $request->name;
            $user->last_name = $request->last_name;
            $user->avatar = $imageName;

            $user->save();
        } else {
            return redirect()->back()->withErrors('Người dùng không tồn tại.');
        }

        return redirect()->route('profile')->with('success', 'Profile updated successfully!');

    }

}
