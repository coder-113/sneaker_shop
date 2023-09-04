<?php

namespace App\Http\Controllers\FE;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Category;
use App\Models\Brand;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Payment;
use Illuminate\Support\Facades\Mail;

use Omnipay\Omnipay;

class CheckoutController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    //Display the checkout page.
    public function checkout(){
        $categories = Category::all();
        $brands = Brand::all();
        return view('fe.checkout',compact('categories','brands'),['title' => 'Check Out']);
    }

    //Save the cart and handle the payment.
    public function saveCart(Request $request){
        //Get data from the request
        $checkoutData = [
            'uid' => $request->uid,
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'email' => $request->email,
            'address' => $request->address,
            'phone' => $request->phone,
            'country' => $request->country,
            'city' => $request->city,
            'payment_type' => $request->payment_type,
        ];
        if($request->payment_type == 'pay_later'){
            $uid = $request->uid;
            $ord = new Order();    
            $ord->user_id = $uid;
            $ord->first_name = $request->first_name;
            $ord->last_name = $request->last_name;
            $ord->email = $request->email;
            $ord->address = $request->address;
            $ord->phone = $request->phone;
            $ord->country = $request->country;
            $ord->city = $request->city;
            $ord->status = 'pending';
            $ord->payment_type = $request->payment_type;
            $ord->save();
    
            $carts = $request->session()->get('cart');
            $details = [];
            $subtotal =0;
            $total = 0;
            foreach($carts as $item){
                $productPrice = $item->product->discount != null ? $item->product->discount : $item->product->price;
                $detail = new OrderItem();
                $detail->product_id = $item->product->id;
                $detail->quantity = $item->quantity;
                $detail->size = $item->size;
                $detail->amount = $productPrice;
                $detail->total = $productPrice * $item->quantity;
                $details[] = $detail;
                $subtotal += $detail->total;
                $total += $detail->total;
            }

            if($request->session()->has('discount')){
                $discount = \Session::get('discount');
                $total = $total - $discount;
            }
    
            $ord->orderItems()->saveMany($details);
            $request->session()->forget('cart');

            //send mail
            $this->sendEmail($ord, $subtotal, $total);

            if($request->session()->has('discount')){
                $request->session()->forget('discount');
            }
            return redirect()->route('result')->with('notification','Success! You will pay on delivery. Please check your mail.');
            
        }elseif ($request->payment_type == 'online_payment') {
            
            $carts = $request->session()->get('cart');
            $total = 0;
            foreach($carts as $item){
                $productPrice = $item->product->discount != null ? $item->product->discount : $item->product->price;
                $total += $productPrice * $item->quantity;
            }
            if($request->session()->has('discount')){
                $discount = \Session::get('discount');
                $total = $total - $discount;
            }

            $gateway = Omnipay::create('PayPal_Rest');

            $gateway->setClientId('AckKljbAE2AV0nT2fgSFAa2HuI-ky-6jtNlXLZwYloucTg5LxkSgtefcII8htayyn5DkkFpxji2UnviQ');
            $gateway->setSecret('EBT3EI1uLzLRw9sXd-h-5nO7bOh-blBtFYOELaqCU18XXYkwZr9P5tgqaWE09c6VkuS46FJEmSGElova');
            $gateway->setTestMode(true); 
    
            $response = $gateway->purchase([
                'amount' => $total, 
                'currency' => 'USD', 
                'returnUrl' => url('/payment/success?checkoutData='.urlencode(json_encode($checkoutData))), 
                'cancelUrl' => url('/payment/cancel'), 
            ])->send();
    
            if ($response->isRedirect()) {
                return redirect($response->getRedirectUrl());
            } else {
                return redirect()->back()->with('error', 'Payment failed. Please try again.');
            }
        }
               
        
    }

    //Handle successful payment.
    public function paySuccess(Request $request)
    {
        // Decode the checkout data from the request
        $checkoutData = json_decode(urldecode($request->input('checkoutData')), true);

        $gateway = Omnipay::create('PayPal_Rest');
        $gateway->setClientId('AckKljbAE2AV0nT2fgSFAa2HuI-ky-6jtNlXLZwYloucTg5LxkSgtefcII8htayyn5DkkFpxji2UnviQ');
        $gateway->setSecret('EBT3EI1uLzLRw9sXd-h-5nO7bOh-blBtFYOELaqCU18XXYkwZr9P5tgqaWE09c6VkuS46FJEmSGElova');
        $gateway->setTestMode(true); 

        if($request->input('paymentId') && $request->input('PayerID')){
            $transaction = $gateway->completePurchase([
                'payer_id' =>$request->input('PayerID'),
                'transactionReference' => $request->input('paymentId')
            ]);
            $response = $transaction->send();
            if ($response->isSuccessful()) {
                $arr = $response->getData();

                $payment = new Payment();
                $payment->payment_id = $arr['id'];
                $payment->payer_id = $arr['payer']['payer_info']['payer_id'];
                $payment->payer_email = $arr['payer']['payer_info']['email'];
                $payment->amount = $arr['transactions'][0]['amount']['total'];
                $payment->currency = 'USD';
                $payment->payment_status = $arr['state'];
                $payment->save(); 

             
                $ord = new Order();
                $ord->user_id = $checkoutData['uid'];
                $ord->first_name = $checkoutData['first_name'];
                $ord->last_name = $checkoutData['last_name'];
                $ord->email = $checkoutData['email'];
                $ord->address = $checkoutData['address'];
                $ord->phone = $checkoutData['phone'];
                $ord->country = $checkoutData['country'];
                $ord->city = $checkoutData['city'];
                $ord->status = 'pending';
                $ord->payment_type = $checkoutData['payment_type'];
                $ord->save();
        
                $carts = $request->session()->get('cart');
                $details = [];
                $subtotal = 0;
                $total = 0;
                foreach($carts as $item){
                    $productPrice = $item->product->discount != null ? $item->product->discount : $item->product->price;
                    $detail = new OrderItem();
                    $detail->product_id = $item->product->id;
                    $detail->quantity = $item->quantity;
                    $detail->size = $item->size;
                    $detail->amount = $productPrice;
                    $detail->total = $productPrice * $item->quantity;
                    $details[] = $detail;
                    $subtotal += $detail->total;
                    $total += $detail->total;
                }

                if($request->session()->has('discount')){
                    $discount = \Session::get('discount');
                    $total = $total - $discount;
                }

                $ord->orderItems()->saveMany($details);
                $request->session()->forget('cart');
                
                //send mail
                $this->sendEmail($ord, $subtotal, $total);

                $request->session()->forget('discount');
                return redirect()->route('result')->with('notification','Success! Has paid online. Please check your mail.');

            } else {
                return $response->getMessage();
            }
        }else{
            return 'Payment declined!!';
        }

    }

    //Handle canceled payment.
    public function payCancel(Request $request)
    {
        return redirect()->route('result')->with('notification','Error! User declined the payment.');
    }

    //Display the checkout result page.
    public function result()
    {
        $categories = Category::all();
        $brands = Brand::all();
        $notification = session('notification');
        return view('fe.result', compact('notification','categories','brands'),['title' => 'Checkout Result']);
    }

    //Send mail
    private function sendEmail($order, $subtotal, $total){
        $email_to = $order->email;
        Mail::send('fe.email', compact('order','subtotal','total') , function ($message) use ($email_to) {
            $message->from('thecot2004@gmail.com','shoes');
            $message->to($email_to, $email_to);
            $message->subject('Order Notification');
        });
    }
}
