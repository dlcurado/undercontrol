$(function() {
  $('#menu').menu();
});

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

