<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $order = Order::all();
        $items =OrderItem::all();
        $product=Product::all();
        $order =Order::paginate(10);
        return view('order.index',compact('order','items','product'));
    }


    public function confirmOrder(Request $request, $id)
    {
        // Tìm đơn hàng theo ID
        $order = Order::findOrFail($id);

        // Lấy trạng thái từ request
        $status = $request->input('status');

        // Cập nhật trạng thái đơn hàng
        $order->status = $status;
        $order->save();


        return redirect()->route('order.index')->with('success', 'Order status updated successfully.');
    }
    public function showOrderDetails($id)
{
    $user = User::findOrFail($id);

    $orders = Order::whereHas('user', function ($query) use ($id) {
        $query->where('id', $id);
    })->get();

    $items = OrderItem::whereIn('order_id', $orders->pluck('id'))->get();
    $product = Product::all();

    return view('order-details', compact('user', 'orders', 'items', 'product'));
}
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
        $prd = Order::findOrFail($id);

        DB::table('order_items') ->where('order_id', $prd->id)->delete();

        $prd->delete();




        return redirect()->route('orders')->with('success', 'Xóa order thành công!');;

    }
}
