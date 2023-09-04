<?php

namespace App\Http\Controllers\FE;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Slider;
use App\Models\Inform;
use App\Models\Category;
use App\Models\Brand;
class HomepageController extends Controller
{
    public function index()
    {
        $products = Product::all();
        $sliders = Slider::all();
        $categories = Category::all();
        $brands = Brand::all();
        return view('fe.homepage', compact('products','sliders','categories','brands'),['title' => 'Homepage']);
    }
    public function sales()
    {
        $products = Product::all();
        $sliders = Slider::all();
        $categories = Category::all();
        $brands = Brand::all();
        return view('fe.sale', compact('products','sliders','categories','brands'),['title' => 'Sales']);
    }
   public function inform()
    {
        $inform = Inform::all();
        return view('fe.inform',compact('inform'));
    }
}