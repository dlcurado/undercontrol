# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
	$('.central-status').click (e, arg) ->
		events = 
    		url: 'eventos/get_all'
    		type: 'GET'
    		data: status: $(this).val()
  		$('#calendar').fullCalendar 'removeEventSource'
  		$('#calendar').fullCalendar 'addEventSource', events
  		$('#calendar').fullCalendar 'refetchEvents', events
  


#$('#users_menu').change(->
#  events = 
#    url: 'ajax/getMyEvents.php'
#    type: 'POST'
#    data: user_id: $(this).val()
#  $('#calendar').fullCalendar 'removeEventSource', events
#  $('#calendar').fullCalendar 'addEventSource', events
#  $('#calendar').fullCalendar 'refetchEvents'
#  return
#).change()
