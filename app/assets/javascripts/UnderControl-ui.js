$(function() {
  $('#menu').menu();

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
