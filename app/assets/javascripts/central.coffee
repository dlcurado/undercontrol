# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



#
# Adiciona o evento de click nos filtros os eventos da agenda por status, na tela central
#
$(document).on "turbolinks:load", ->
	$('.central-status').click (e, arg) ->
		all_status = []
		$(".central-status:checked").each ->
    		all_status.push($(this).val())

		events = 
    		url: 'eventos/get_all'
    		type: 'GET'
    		data: status: all_status
  		$('#calendar').fullCalendar 'removeEventSources'
  		$('#calendar').fullCalendar 'addEventSource', events
  		#$('#calendar').fullCalendar 'refetchEvents', events


$(document).on "turbolinks:load", ->
	$('.sidebar-toggle-box').click (e, arg) ->
		if($('.asidebar').css('display') == 'none')
			$('.asidebar').css('display', 'block')
			$('#main-content').css('width', '82%')
		else
			$('.asidebar').css('display', 'none')
			$('#main-content').css('width', 'auto')
