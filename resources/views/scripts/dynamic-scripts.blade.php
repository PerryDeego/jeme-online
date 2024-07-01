<script type="text/javascript">
    $(document).ready(function() {
        $('#service_id').change(function(){
            var serviceID = $(this).val();    
            if(serviceID){
                $.ajax({
                    type:"GET",
                    url:"{{url('get-building-list')}}?service_id="+serviceID,
                    success:function(res){               
                        if(res != ""){
                            $("#building_id").empty();
                            $.each(res,function(key,value){
                                $("#building_id").append('<option value="'+key+'">'+value+'</option>');
                            });
                    
                        }else{
                            $("#building_id").empty();
                            $("#location_id").empty();
                            $("#machine_id").empty();
                        }
                    }
                });
            }else{
                $("#building_id").empty();
                $("#location_id").empty();
                $("#machine_id").empty();
            }      
        });
    
        $('#service_id').on('change',function(){
            var buildingID = $(this).val();    
            if(buildingID){
                $.ajax({
                type:"GET",
                url:"{{url('get-machine-list')}}?service_id="+buildingID,
                success:function(res){               
                    if(res){
                        $("#machine_id").empty();
                        $.each(res,function(key,value){
                            $("#machine_id").append('<option value="'+key+'">'+value+'</option>');
                        });
                
                    }else{
                    $("#machine_id").empty();
                    }
                }
                });
            }else{
                $("#machine_id").empty();
            }  
        });

        $('#service_id').on('change',function(){
            var buildingLocationID = $(this).val();    
            if(buildingLocationID){
                $.ajax({
                    type:"GET",
                    url:"{{url('get-location-list')}}?building_id="+buildingLocationID,
                    success:function(res){               
                        if(res){
                            $("#location_id").empty();
                            $.each(res,function(key,value){
                                $("#location_id").append('<option value="'+key+'">'+value+'</option>');
                            });
                    
                        }else{
                        $("#location_id").empty();
                        }
                    }
                });
            }else{
                $("#location_id").empty();
            }  
        });

    });
</script>