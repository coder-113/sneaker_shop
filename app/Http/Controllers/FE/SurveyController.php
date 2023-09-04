<?php

namespace App\Http\Controllers\FE;
use App\Models\Brand;
use App\Models\Coupon;
use App\Models\Category;
use App\Models\Product;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Survey;
use Illuminate\Support\Str;
class SurveyController extends Controller
{
    public function index()
    {  $products = Product::all();
        $survey = Survey::all();
        $categories = Category::all();
        $brands = Brand::all();
        return view('fe.survey',compact('survey','categories','brands','products'),['title' => 'Survey']);
    }

    public function __construct()
    {
        $this->middleware('auth');
    }
    public function submit(Request $request)
    {
        // Validate the survey submission data
        $validatedData = $request->validate([
            'user_choice' => 'required',
            'user_provide' => 'required',
        ]);

        // Process the survey submission and save it to the database
        $survey = new Survey();
        $survey->user_chosen = $validatedData['user_choice'];
        $survey->user_provide = $validatedData['user_provide'];

        // Retrieve a random promotion code from the coupon table
        $promotionCode = Coupon::pluck('code')->random();

        // Associate the retrieved promotion code with the survey
        $survey->code = $promotionCode;

        // Save the survey to the database
        $survey->save();



        // Return a response with the generated promotion code
        return view('fe.confirmation', ['promotionCode' => $promotionCode]);
    }


    public function admin()
    {
        $survey = Survey::all();
        $survey = Survey::paginate(10); // Số lư
        return view('survey.index',compact('survey'));
    }
    public function create()
    {
        $survey = Survey::all();
        return view('survey.create',compact('survey'));
    }
   public function store(Request $request)
{
    $request->validate([
        'photo' => 'required|image|mimes:jpeg,png,jpg,gif|max:2048',
    ]);

    if ($request->hasFile('photo')) {
        $image = $request->file('photo');
        $imageName = time() . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('images'), $imageName);

        $survey = Survey::create([
            'photo' => $imageName,
        ]);

        return redirect('/survey')->with('success', 'Survey photo created successfully.');
    }

    return redirect()->back()->with('error', 'Error creating survey photo.');
}
public function edit(Survey $survey)
{
    return view('survey.edit', compact('survey'));
}
public function update(Request $request, Survey $survey)
{
    $validatedData = $request->validate([
        'photo' => 'image|mimes:jpeg,png,jpg,gif|max:2048',
    ]);

    if ($request->hasFile('photo')) {
        $image = $request->file('photo');
        $imageName = time() . '.' . $image->getClientOriginalExtension();
        $image->move(public_path('images'), $imageName);

        $survey->photo = $imageName;
        $survey->save();

        return redirect()->route('survey.admin', $survey->id)->with('success', 'Survey photo updated successfully');
    }

    return redirect()->route('survey.admin', $survey->id)->with('error', 'No photo file selected');
}


public function destroy($id)
{
    $survey = Survey::findOrFail($id);
    $survey->delete();

    return redirect('/survey')->with('success', 'Survey photo deleted successfully.');
}
}
