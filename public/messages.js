// jQuery(function() {
//   return $('#message_message_script_title').autocomplete({
//     source: $('#message_message_script_title').data('autocomplete-source')
//   });
// });

jQuery(function() {
    function log( message ) {
      $( "<div>" ).text( message ).prependTo( "#log" );
	  $('#message_body').val( message )
      $( "#log" ).scrollTop( 0 );
    }
 
    $('#message_message_script_body').autocomplete({
	  source: $('#message_message_script_body').data('autocomplete-source'),
    minLength: 2,
      select: function( event, ui ) {
        log(ui.item.value );
      }
	  
  });
});



// jQuery(function() {
//   $( "#choice" ).autocomplete({
//     source: [ { label: "Choice1", value: "value1" }, { label: "Choice2", value: "value2" }, { label: "Choice3", value: "value3" }],
//     minLength: 2,
//       select: function( event, ui ) {
//               event.preventDefault();
//               $('#message_message_script_title').val(ui.item.label);
//   			this.value = ui.item.label;
//   			$('#message_message_script_body').val(ui.item.value);
//       }
//
//   });
// });
//
