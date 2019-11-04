<script type="text/javascript">
	$(document).ready(function () {
		//Flash-message timer.
		$("#timer").fadeTo(3000, 500).slideUp(500, function(){
			$("#timer").slideUp(500);
		});

		//Form confirm (yes/ok) handler, submits form
		$('table[data-form="deleteConfirm"]').on('click', '.form-delete', function(e){
			e.preventDefault();
			var $form=$(this);
			$('#confirm').modal({ backdrop: 'static', keyboard: false })
				.on('click', '#delete-btn', function(){
					$form.submit();
			});
		});
	

		//Bootstrap live filter, pagination and export for table lists.
		$('#tbl-list').DataTable({
			dom: 'lBfrtip',
			buttons: [
				'copy', 'csv', 'excel', 'pdf', 'print', 'colvis'
			],
			"lengthMenu": [ [10, 25, 50, 100, -1], [10, 25, 50, 100, "All"] ]
		});
		
	
		//Date picker
		$('#date').datepicker({
			autoclose: true,
			format: 'yyyy-mm-dd'
		});

		//Start date picker
		$('#start_date').datepicker({
			autoclose: true,
			format: 'yyyy-mm-dd'
		});

		//End date picker
		$('#end_date').datepicker({
			autoclose: true,
			format: 'yyyy-mm-dd'
		});
	
		
		//Hide image(s) container when file upload is clicked
		$('#images').click(function() {
			$('.img_container,.text-center').slideUp();
		});
	

		//Image preview canvas.
		if (window.File && window.FileList && window.FileReader) {
			$("#images").on("change", function(e) {
			
			var files = e.target.files,
				filesLength = files.length;
				//var width = "400";
				//var height = "400";
			for (var i = 0; i < filesLength; i++) {
				var f = files[i]
				var fileReader = new FileReader();
				fileReader.onload = (function(e) {
					var file = e.target;
					
					$("<br>"+"<span class=\"pip\">" +
						"<img class=\"preview_img\" src=\"" + e.target.result + "\" width=\"100%" + file.name + "\"/>" +
						"<br/><a href='#' class=\"remove\">Remove image</a>" +
						"</span>"+"<br>").insertAfter("#images");
					$(".remove").click(function(){
						$(this).parent(".pip").remove();
					});
				
				});
				fileReader.readAsDataURL(f);
			}
			});
		} else {
			alert("Your browser doesn't support to File API")
		}
			

	});
</script>




