# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#### Carregando o date picker no formulario de edicao e inclusao de eventos
$(document).on "turbolinks:load", ->
  $('.datepicker').datepicker({
  	changeMonth: true
  	changeYear: true
  	dateFormat: 'dd/mm/yy'
  })
  

$(document).on "turbolinks:load", ->
	$('.combo_autocomplete').focus ->
		@value = ''
	$('.combo_autocomplete.nome').autocomplete({
		source: (request, response) ->
			$.ajax
				url: '/clientes/get_by_term'
				type: 'GET'
				dataType: 'json'
				data: term: request.term
				error: ->
					alert 'Erro'
				success: (data) ->
					response data
	})



$(document).on "turbolinks:load", ->
   $('.container .card .action a[data-remote]').on "ajax:success", (e, data, status, xhr) ->
      $('.modal').dialog({
         modal: true
         height: 600
         width: 800
         position: { my: "center", at: "center" }
      })
      return

$(document).on "turbolinks:load", ->
   $('.container .card .action a[data-remote]').on "ajax:error", (e, data, status, error) ->
      $('.modal').html(error).dialog()
      $('.modal').dialog()
      return