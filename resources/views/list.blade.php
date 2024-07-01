<!DOCTYPE html>
<html>
<head>
    <title>Ajax dynamic dependent service building machine dropdown Laravel 5.6</title>   
    <script src="{{ asset('plugins\jQuery\jquery-2.2.3.min.js') }}"></script>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
      <div class="panel-heading">Ajax dynamic dependent service building machine dropdown using jquery ajax in Laravel 5.6</div><br>
      <div class="panel-body">
            <div class="form-group">
                <select name="service" id="service" class="form-control" style="width:350px">
                <option value="" selected disabled>--Select Service No--</option>
                  @foreach($serivice_numbers as $key => $service_number)
                  <option value="{{$key}}"> {{$service_number}}</option>
                  @endforeach
                  </select>
            </div>
            
            <div class="form-group">
                <label for="title">Select Building:</label>
                <select name="building" id="building" class="form-control" style="width:350px">
                    <option>--Building--</option>
                </select>
            </div>
            <div class="form-group">
                <label for="title">Select Machine:</label>
                <select name="machine" id="machine" class="form-control" style="width:350px">
					<option>--Machine--</option>
                </select>
            </div>
            <div class="form-group">
                <label for="title">Select Location:</label>
                <select name="location" id="location" class="form-control" style="width:350px">
					<option>--Location--</option>
                </select>
            </div>
            
      </div>
    </div>
</div>

<div class="wrapper">
        <input type="file" id="images" />
      </div>
      <div class="preview_img">
      </div>

<script type="text/javascript">
    $(document).ready(function() {

        $('#images').on('change', function(evt) {
  var selectedImage = evt.currentTarget.files[0];
  var imageWrapper = document.querySelector('.preview_img');
  var theImage = document.createElement('img');
  imageWrapper.innerHTML = '';
 
  var regex = /^([a-zA-Z0-9\s_\\.\-:])+(.jpg|.jpeg|.gif|.png|.bmp)$/;
  if (regex.test(selectedImage.name.toLowerCase())) {
    if (typeof(FileReader) != 'undefined') {
      var reader = new FileReader();
      reader.onload = function(e) {
          theImage.id = 'new-selected-image';
          theImage.src = e.target.result;
          imageWrapper.appendChild(theImage);
        }
        //
      reader.readAsDataURL(selectedImage);
    } else {
      //-- Let the user knwo they cannot peform this as browser out of date
      console.log('browser support issue');
    }
  } else {
    //-- no image so let the user knwo we need one...
    $(this).prop('value', null);
    console.log('please select and image file');
  }

});


        $('#service').change(function(){
            var serviceID = $(this).val();    
            if(serviceID){
                $.ajax({
                    type:"GET",
                    url:"{{url('get-building-list')}}?service_id="+serviceID,
                    success:function(res){               
                        if(res != ""){
                            $("#building").empty();
                            $.each(res,function(key,value){
                                $("#building").append('<option value="'+key+'">'+value+'</option>');
                            });
                    
                        }else{
                            $("#building").empty();
                            $("#location").empty();
                            $("#machine").empty();
                        }
                    }
                });
            }else{
                $("#building").empty();
                $("#location").empty();
                $("#machine").empty();
            }      
    });
    
        $('#service').on('change',function(){
            var buildingID = $(this).val();    
            if(buildingID){
                $.ajax({
                type:"GET",
                url:"{{url('get-machine-list')}}?service_id="+buildingID,
                success:function(res){               
                    if(res != ""){
                        $("#machine").empty();
                        $.each(res,function(key,value){
                            $("#machine").append('<option value="'+key+'">'+value+'</option>');
                        });
                
                    }else{
                    $("#machine").empty();
                    }
                }
                });
            }else{
                $("#machine").empty();
            }  
    });

    $('#service').on('change',function(){
            var buildingLocationID = $(this).val();    
            if(buildingLocationID){
                $.ajax({
                type:"GET",
                url:"{{url('get-location-list')}}?building_id="+buildingLocationID,
                success:function(res){               
                    if(res != ""){
                        $("#location").empty();
                        $.each(res,function(key,value){
                            $("#location").append('<option value="'+key+'">'+value+'</option>');
                        });
                
                    }else{
                    $("#location").empty();
                    }
                }
                });
            }else{
                $("#location").empty();
            }  
        });

    });
</script>

</body>
</html>