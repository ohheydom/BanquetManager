$(document).ready(function(){
  $(document).on('click', '#clients th a, #clients .pagination a', function(){
    $.getScript(this.href)
    return false;
  });
  $('#clients_form input').keyup(function(){
    $.get($('#clients_form').attr('action'), $('#clients_form').serialize(),null, "script");
    return false;
  });
  $('#clients_form [name="datescope"]').change(function(){
     $.get($('#clients_form').attr('action'), $('#clients_form').serialize(), null, "script");
    return false;
  });
});
