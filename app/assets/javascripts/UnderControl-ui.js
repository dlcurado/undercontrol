$(function() {
  $('#menu').menu();

  /*
  $('.datepicker').datepicker({
  	changeMonth: true,
  	changeYear: true
  });
  */
  var nomesClientes = [
    "AAAAAA",
    "FFFFF",
    "ASADAS",
    "F#RRWEREWQ"
  ];
  
  $('.combo_autocomplete').autocomplete({
  	source: nomesClientes
  });
})



/*
$(function() {
  $('ul.sidebar-menu li a').each(function(element){
  	   var $this_link = $(this).attr('href');
	   if($this_link == $current_url) {
	     $(this).addClass("link-active");
	   } else {
	     $(this).removeClass("link-active");
	   }
  });
  
  
});
*/