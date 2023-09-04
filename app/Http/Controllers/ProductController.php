<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\Brand;
use App\Models\ProductImage;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\DB;
use App\Models\ProductDetail;


class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index()
    {
        $products = Product::all();
        $images = ProductImage::all();
        $prdtel = ProductDetail::all();
        $products = Product::paginate(10); // Số lượng sản phẩm hiển thị trên mỗi trang, ở đây là 10
        return view('product.index', compact('products', 'images', 'prdtel'));
    }


    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $cates = Category::all();
        $brand = Brand::all();
        return view('product.create', compact('cates', 'brand'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'required|string|max:255',
            'description' => 'required|string|max:1000',
            'price' => 'required|integer',
            'sku' => 'required|string|max:255',
            'featured' => 'required|string|max:255',
        ], [
            'name.required' => 'Please enter the product name.',
            'slug.required' => 'Please enter the product slug.',
            'sku.required' => 'Please enter the product SKU.',
            'description.required' => 'Please enter the product description.',
            'price.required' => 'Please enter the product price.',
            'price.integer' => 'The product price must be an integer.',
            'featured.required' => 'Please enter the featured attribute of the product.',
        ]);
        $product = Product::create([
            'name' => $request->name,
            'slug' => $request->slug,
            'sku' => $request->sku,
            'description' => $request->description,
            'content' => $request->content,
            'price' => $request->price,
            'discount' => $request->discount,
            'category_id' => $request->category,
            'brand_id' => $request->brand,
            'featured' => $request->featured,
        ]);

        if ($request->hasFile('photo')) {
            $file = $request->file('photo');
            $extension = $file->getClientOriginalExtension();
            if ($extension != 'jpg' && $extension != 'png' && $extension != 'jpeg' && $extension != 'avif' && $extension != 'webp') {
                return redirect()->back()->withErrors('Định dạng hình ảnh không hợp lệ.');
            }
            $imageName = $file->getClientOriginalName();
            $file->move("images", $imageName);

            $product_image = ProductImage::create([
                'product_id' => $product->id,
                'photo' => $imageName,
            ]);
        }
        session()->flash('success', 'Product has been successfully saved.');

        return redirect('/product');
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
    public function edit(string $id, Request $request)
    {
        // Lấy thông tin sản phẩm từ cơ sở dữ liệu
        $product = Product::findOrFail($id);

        return view('product.edit', compact('product'));
    }





    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {

        $product = Product::findOrFail($id);
        $request->validate([
            'name' => 'required|string|max:255',
            'slug' => 'required|string|max:255',






        ],[
            'name.required' => 'Please enter the product name.',
            'slug.required' => 'Please enter the product slug.',




        ]);
        $product->update($request->all());
        session()->flash('success', 'Product has been successfully saved.');
        return redirect()->route('product');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $product = Product::findOrFail($id);

        // Xóa bản ghi liên quan từ bảng product_images
        DB::table('product_images') ->where('product_id', $product->id)->delete();

         // Xóa bản ghi liên quan từ bảng product_images
         DB::table('product_details')->where('product_id', $product->id)->delete();


        // Xóa bản ghi từ bảng products
        $product->delete();




        return redirect()->route('product')->with('success', 'Product has been successfully deleted.!');;
    }

}
