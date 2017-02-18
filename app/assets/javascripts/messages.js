jQuery(function() {
  return $('#message_message_script_title').autocomplete({
    source: $('#message_message_script_title').data('autocomplete-source')
  });
});