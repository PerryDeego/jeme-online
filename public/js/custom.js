   $(document).ready(function() {
		$('#service').change(function(){
		var serviceID = $(this).val();    
		if(serviceID){
			$.ajax({
			type:"GET",
			url:"{{url('building-list')}}?service_id="+serviceID,
			success:function(res){               
				if(res){
					$("#building").empty();
				// $("#building").append('<option>Select</option>');
					$.each(res,function(key,value){
						$("#building").append('<option value="'+key+'">'+value+'</option>');
					});
			
				}else{
				$("#building").empty();
				}
			}
			});
		}else{
			$("#building").empty();
			$("#machine").empty();
		}      
	});
		$('#building').on('change',function(){
		var buildingID = $(this).val();    
		if(buildingID){
			$.ajax({
			type:"GET",
			url:"{{url('machine-list')}}?building_id="+buildingID,
			success:function(res){               
				if(res){
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
   });
