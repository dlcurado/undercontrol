# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
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
