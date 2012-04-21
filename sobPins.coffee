$(document).ready ->
	class SobsPin extends Backbone.Model
	class SobsPins extends Backbone.Collection
		model: SobsPin
	class SobsPinView extends Backbone.View
		el: $('.header')
		initialize: ->
			_.bindAll @
			@render()
		render: ->
			imgSquareTemplate = ich.imgPinSquare(@model.toJSON())
			$(@el).append imgSquareTemplate
			@
		pinMe: ->
			alert 'PIN ME!'

		events:
			'click button' :'pinMe'

	$('.separator > a').each(->
		sobsPin = new SobsPin(
			escapedUrl: encodeURIComponent(@href)
			imgUrl: @href
			altText: "Alt Text Coming Soon!"
			postUrl: "www.quietlikehorses.com"
		)
		console.log sobsPin.toJSON()
		pinView = new SobsPinView model: sobsPin
		)

