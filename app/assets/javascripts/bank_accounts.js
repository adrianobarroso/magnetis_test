$(document).ready(function(){
  $('.close').click(function(){
    $(this).parent().hide();
  });

  $('#show-savings').click(function(){
    $('.savings').text($('.savings').data('savings'))
  });
});
