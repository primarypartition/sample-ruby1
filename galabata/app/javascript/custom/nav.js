require("semantic-ui-sass")

$(document).on('turbolinks:load', function() {
  $('.ui.dropdown').dropdown();
  
  $('.message .close').on('click', function() {
    $(this).closest('.message').transition('fade');
  });  
})
