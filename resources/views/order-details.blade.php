<!DOCTYPE html>
<html>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        box-shadow: 0 5px 15px rgb(188, 188, 188);
        
        border: 1px solid green;
        width: 50%;
        margin-left: 30%;
        
    }

    ul {
        list-style-type: none;
        padding: 0;
    }

    li {
        margin-bottom: 10px;
        margin-left: 20px;

    }

    p {
        margin-top: 10px;
        margin-left: 20px;
    }

    .status-confirm {
        color: green;
    }

    .status-cancel {
        color: red;
    }

    h2{
        text-align: center;
    }
    h3{
        margin-left: 5px;
    }
</style>

<body>
        <h2>Chi tiết đơn hàng</h2>
        @foreach($orders as $order)
        <p><b>Trạng thái:</b> {{ $order->status }}</p>

        <h3>Thông tin đơn hàng:</h3>
        <ul>
            @foreach ($items as $item)
            @if ($item->order_id == $order->id)
            <li>
                <b>Product:</b>
                @php
                $product = $product->find($item->product_id);
                @endphp
                {{ $product->name }}
            </li>
            @endif
            @endforeach

            <li><b>Địa chỉ:</b> {{ $order->address }}</li>
            <!-- Các thông tin khác của đơn hàng -->
            <li><b>Tên:</b> {{ $order->first_name }} {{ $order->last_name }}</li>
            <li><b>Phone:</b> {{ $order->phone }}</li>
            <li><b>Email:</b> {{ $order->email }}</li>
            <li><b>Payment:</b> {{ $order->payment_type }}</li>
            <li><b>Total:</b> {{ $order->total }}</li>
        </ul>
        @endforeach
</body>

</html>