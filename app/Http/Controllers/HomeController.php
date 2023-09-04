<?php

namespace App\Http\Controllers;
use App\Models\Order;
use App\Models\Coupon;
use App\Models\OrderItem;

use App\Models\User;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {

        $order = Order::count();
        $totalAmount = OrderItem::sum('total');

        $coupon = Coupon::count();

        $users = User::count();

        $widget = [
            'users' => $users,
            'order' => $order,
            'amount' => $totalAmount,
            'coupon' => $coupon,

        ];

        return view('home', compact('widget','order','totalAmount','coupon'));
    }
}
