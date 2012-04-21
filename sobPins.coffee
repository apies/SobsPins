jQuery ->
	class SobsPin extends Backbone.Model

	class SobsPins extends Backbone.Collection
		model: sobsPin

	class PinView extends Backbone.Views
		el: $ 'body'
		initialize: ->
			_.bindAll @
			@render()
		
		render: ->
			imgSquareTemplate = ich.imgPinSquare(@model.toJSON())
			$(@el).append imgSquareTemplate
			@
	$('.separator > a').each(->
		console.log @.href
		)
console.log 'HELLO'
$(document).ready ->
	console.log 'HELLO'
	$('.separator > a').each(->
		imgUrl = @.href
		console.log imgUrl
		sobsPin = new SobsPin( imgUrl: imgUrl)
		console.log sobsPin.toJSON()
		pinView = new pinView model: sobsPin
		$('body').append pinView 
		)
