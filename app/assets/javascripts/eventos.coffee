# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "turbolinks:load", ->
  $('.datepicker').datepicker({
  	changeMonth: true
  	changeYear: true
  })

data_eventos = []
#data_eventos_do_dia = []

$(document).on "turbolinks:load", ->
  $('#calendar').fullCalendar({
		eventSources: [
			{
			url: '/eventos/get_all'
			type: 'GET'
			error: ->
				alert 'Erro'
			success: (data) ->
				data_eventos = data
			}
		]
		dayClick: (date, jsEvent, view) ->
			$.ajax
				url: '/eventos/show_many'
				type: 'GET'
				data:
					date: date.toJSON()
				error: ->
					$('.modal').html('Erro').dialog()
					$('.modal').dialog()
				success: (data) ->
					$('.modal').dialog()
  })

 
# {
# title: 'Casamento: Claudia'
# start: '2018-01-13'
# end: '2018-01-13'
# backgroundColor: 'red'
# },{
# title: 'Casamento: Marcelo',
# start: '2018-01-13',
# end: '2018-01-13',
# backgroundColor: 'red'
# },{
# title: 'Casamento: Adriana',
# start: '2018-01-20',
# end: '2018-01-20',
# backgroundColor: 'red'
# },{
# title: 'Formatura: ESCOLA',
# start: '2018-01-01',
# end: '2018-01-01',
# backgroundColor: 'green'
# },{
# title: 'Corporativo: EPTV',
# start: '2018-01-27',
# end: '2018-01-27',
# backgroundColor: 'blue'
# },{
# title: '15 anos: Tais',
# start: '2018-01-30',
# end: '2018-01-30',
# backgroundColor: 'purple'
# }
