// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui   
//= require jquery_ujs
//= require chosen-jquery
//= require messages
//= require cocoon
//= require social-buttons
		
//= require_tree .


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
