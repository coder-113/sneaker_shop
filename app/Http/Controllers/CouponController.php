<?php

namespace App\Http\Controllers;

use App\Models\Coupon;
use Illuminate\Http\Request;

class CouponController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $coupon = Coupon::all();
        return view('coupon.index', compact('coupon'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $coupon = Coupon::all();
        return view('coupon.create', compact('coupon'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {

        $request->validate([
            'code' => 'required|string|max:255',
            'discount_amount' => 'required|integer',
        ], [
            'code.required' => 'Please enter the code.',
            'discount_amount.required' => 'Please enter the product discount.',
            'discount_amount.integer' => 'The product discount must be an integer.'

        ]);
        $coupon = Coupon::create([
            'code' => $request->code,
            'expiry_date' => $request->expiry_date,
            'discount_amount' => $request->discount_amount,
        ]);
        session()->flash('success', 'The discount code has been successfully saved.');

        return redirect('/coupons');
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
        $coupon = Coupon::findOrFail($id);
        return view('coupon.edit', compact('coupon'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {

        $coupon = Coupon::findOrFail($id);
        $request->validate([
            'code' => 'required|string|max:255',
            'discount_amount' => 'required|integer',
        ], [
            'code.required' => 'Please enter the code.',
            'discount_amount.required' => 'Please enter the product discount.',
            'discount_amount.integer' => 'The product discount must be an integer.'

        ]);
        $coupon->update($request->all());
        session()->flash('success', 'The discount code has been successfully saved.');

        return redirect('/coupons');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $coupon = Coupon::findOrFail($id);
        $coupon->delete();

        session()->flash('success', 'The discount code has been successfully deleted');

        return redirect('/coupons');
    }
}
