<style>
 .container {
  max-width: 800px;
  margin: 0 auto;
}

h2 {
  text-align: center;
  font-family: monospace;  
  margin-bottom: 20px;
}

.alert {
  margin-bottom: 20px;
}

.profile-wrapper {
  display: flex;
  align-items: flex-start;
  margin-bottom: 20px;
}

.avatar-section {
  width: 200px;
  display: flex;
  flex-direction: column;
  align-items: center;
  margin-right: 20px;
}

.avatar-preview {
  width: 150px;
  height: 150px;
  overflow: hidden;
  border-radius: 50%;
}

.avatar {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.profile-info {
  text-align: center;
  margin-top: 10px;
}

.form-section {
  flex: 1;
}

.form-group {
  margin-bottom: 20px;
}

label {
  font-weight: bold;
}

input[type="text"],
input[type="email"],
input[type="file"],
.form-control-file {
  width: 100%;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}
button{
    background-color: black;
    border-radius: 5px;
    color: white;
    padding: 10px 40px;
}
button:hover{
    background-color: white;
    color: black;   
    
}
button[type="submit"] {
  display: block;
 
}
button.btn.btn-primary {
  display: block;
  margin: 0 auto;
}
.timeline {
        position: relative;
        padding: 40px 0;
        margin-bottom: 40px;
    }

    .timeline::before {
        content: "";
        position: absolute;
        top: 0;
        left: 50%;
        transform: translateX(-50%);
        height: 100%;
        width: 4px;
        background-color: #ccc;
    }

    .timeline-item {
        position: relative;
        margin-bottom: 40px;
    }

    .timeline-item:last-child {
        margin-bottom: 0;
    }

    .timeline-content {
        position: relative;
        margin-left: 30px;
        padding: 20px;
        border-radius: 5px;
        background-color: #f1f1f1;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
    }

    .timeline-content h4 {
        margin-top: 0;
        margin-bottom: 10px;
        color: #333;
        font-size: 18px;
        font-weight: bold;
    }

    .timeline-content p {
        margin-bottom: 20px;
        color: #777;
    }

    .timeline-status {
        position: absolute;
        top: 20px;
        right: 20px;
        padding: 8px 12px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: bold;
        color: #fff;
        text-transform: uppercase;
    }

    .timeline-status.green {
        background-color: #28a745;
        color:green;
    }

</style>
<div class="container">
  <h2>Your Profile</h2>
  <div style="display: flex; justify-content: flex-end;">
  <small>Thanks for joining <span>D<span style="color:red;">ea</span>lZone</span>!</small>
</div>

  @if (session('success'))
  <div class="alert alert-success">
    {{ session('success') }}
  </div>
  @endif

  <div class="profile-wrapper">
    <div class="avatar-section">
      <div class="avatar-preview">
        @if ($user->avatar == null)
        <img src="{{ asset('/images/profile.jpeg') }}" alt="Profile Picture" class="avatar">
        @else
        <img src="{{ '/images/' . $user->avatar }}" alt="Profile Picture" class="avatar">
        @endif
      </div>
      <div class="profile-info">
        <h4>{{ $user->name }}</h4>
        <p>{{ $user->email }}</p>
      </div>
    </div>

    <div class="form-section">
      <form action="{{ route('profilefe.update') }}" method="POST" enctype="multipart/form-data">
        @csrf

        <div class="form-group">
          <label for="name">Name</label>
          <input type="text" class="form-control" id="name" name="name" value="{{ $user->name }}" required>
        </div>

        <div class="form-group">
          <label for="last_name">Last Name</label>
          <input type="text" class="form-control" id="last_name" name="last_name" value="{{ $user->last_name }}" required>
        </div>

        <div class="form-group">
          <label for="email">Email</label>
          <input type="email" class="form-control" id="email" name="email" value="{{ $user->email }}" required>
        </div>

        <div class="form-group">
        <label>Avtar:</label>
    <input type="file" name="avatar" id="photo" onchange="previewImage(event)">
    <br>
    <img id="preview" src="#" alt="Preview" style="max-width: 200px; max-height: 200px; display: none;">
</div>

<script>
function previewImage(event) {
    var input = event.target;
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            var preview = document.getElementById('preview');
            preview.src = e.target.result;
            preview.style.display = 'block';
        }
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
        

        <button type="submit" class="btn btn-primary text-center">Update </button>
        <a href="{{ route('homepage') }}" class="btn btn-secondary text-center" style="text-decoration:none;color:red;font-size:20px;"> <- Go Back To Home Page</a>
      </form>

    </div>
    
  </div>
  <h2>Orders Tracking </h2>
  <div class="timeline">
    @foreach($orders as $order)
        @if($order->user_id === auth()->user()->id)
            <div class="timeline-item">
                <div class="timeline-content">
                    <h4>Customer Name: {{ $order->first_name }}</h4>
                    <p>Product Name: {{ $order->orderItems->first()->product->name }}</p>
                    <p>Address: {{ $order->address }}</p>
                    <p>Phone: {{ $order->phone }}</p>
                    <p>Email: {{ $order->email }}</p>
                    <p>Quantity: {{ $order->orderItems->first()->quantity }}</p>
                    <p>Price: {{ $order->orderItems->first()->product->price }}</p>
                    <img src="{{ '/images/' . $order->orderItems->first()->product->productimages->first()->photo }}" width="20%" alt="Product Image">

                    <span class="timeline-status" style="color:
                        @if($order->status === 'confirmed')
                            green;
                        @elseif($order->status === 'pending')
                            Gold;
                        @elseif($order->status === 'canceled')
                            red;
                        @endif">
                        {{ $order->status }}
                    </span>
                </div>
            </div>
        @endif
    @endforeach
</div>


</div>
