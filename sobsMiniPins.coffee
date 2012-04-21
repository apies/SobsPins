$(document).ready ->
	class SobsPin extends Backbone.Model
	class SobsPins extends Backbone.Collection
		model: SobsPin
	class SobsPinView extends Backbone.View
		el: $('.header section')
		initialize: ->
			_.bindAll @
			@render()
		render: ->
			imgSquareTemplate = ich.imgPinSquare(@model.toJSON())
			$(@el).append imgSquareTemplate
			console.log imgSquareTemplate
			@
		pinMe: ->
			
		events:
			'click button' :'pinMe'

	$('.separator > a').each(->
		sobsPin = new SobsPin(
			imgUrl: @.href
			altText: "Alt Text Coming Soon!"
			postUrl: "www.quietlikehorses.com"
		)
		console.log sobsPin.toJSON()
		pinView = new SobsPinView model: sobsPin
		)
	console.log 'HELLO'

console.log 'HELLO'



