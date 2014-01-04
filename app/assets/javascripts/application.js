//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
$(document).ready(function(){
  $(document).on('click', '#clients th a, #clients .pagination a', function(){
    $.getScript(this.href)
    return false;
  });
  $('#clients_form input').keyup(function(){
    $.get($('#clients_form').attr('action'), $('#clients_form').serialize(),null, "script");
    return false;
  });
});
