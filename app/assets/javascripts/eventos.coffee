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

# 
# Carrega o Fullcalendar da tela central, com os eventos de acordo com o filtro do controller
# Também adiciona o click na data da agenda, para mostrar os eventos do dia
#
$(document).on "turbolinks:load", ->
  $('#calendar').fullCalendar({
		eventSources: [
			{
			url: '/eventos/get_all'
			type: 'GET'
			error: ->
				alert 'Erro'
			}
		]
		dayClick: (date, jsEvent, view) ->
			$.ajax
				url: '/eventos/show_many'
				type: 'GET'
				data: date: date.toJSON()
				error: ->
					$('.modal').html('Erro').dialog()
					$('.modal').dialog()
				success: (data) ->
					$('.modal').dialog()
  })
  

##### Combo auto-complete para nomes dos clientes  
#$(document).on "turbolinks:load", ->
#	$('.combo_autocomplete').focus ->
#		@value = ''

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