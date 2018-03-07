# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "turbolinks:load", ->
	$('.combo_autocomplete').focus ->
		@value = ''
	$('.combo_autocomplete nome').autocomplete({
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