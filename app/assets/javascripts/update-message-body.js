// to be refactored and placed into its own .js file
	$(function($) {
	    $("#message_message_script_id").change(function() {
	        var selected_id = $("#message_message_script_id").val()
	        if (selected_id == '')
	        {
	          $('#message_body').val('')
	        }
	        else {
	          $.ajax({
	            type: "GET",
	            url: "/message_scripts/" + selected_id + ".json",
	            dataType: 'json',
	            success: function(data){
	              $('#message_body').val(data.body)
	            }
	          });
	        }
	    });
	});

// to be refactored and placed into its own .js file
	$(function($) {
	    $("#broadcast_message_script_id").change(function() {
	        var selected_id = $("#broadcast_message_script_id").val()
	        if (selected_id == '')
	        {
	          $('#broadcast_message_body').val('')
	        }
	        else {
	          $.ajax({
	            type: "GET",
	            url: "/message_scripts/" + selected_id + ".json",
	            dataType: 'json',
	            success: function(data){
	              $('#broadcast_message_body').val(data.body)
	            }
	          });
	        }
	    });
	});

