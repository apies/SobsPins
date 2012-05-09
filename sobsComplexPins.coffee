$(document).ready ->
	class OverLay extends Backbone.Model
		defaults:
	        color: 'black',
	        opacity: '0.5',
	        top: 0
			
	class OverLayView extends Backbone.View
		initialize: ->
			@render()
		render: =>
			overModel = new OverLay top: $(document).scrollTop()
			overLayTemplate = ich.overLay(overModel.toJSON());
			$('body').append(overLayTemplate);
			@
	class SobsPin extends Backbone.Model
				
	class SobsPins extends Backbone.Collection
		model: SobsPin
		@fetchPins: =>
			console.log 'Fetch Pins Being Called!'
			pins = []
			$('.separator > a').each(->
				sobsPin = new SobsPin(
					escapedUrl: encodeURIComponent(@href)
					imgUrl: @href
					altText: "Alt Text Coming Soon!"
					postUrl: "www.quietlikehorses.com"
				)
				pins.push sobsPin
				)
			pins
		
	class SobsPinView extends Backbone.View
		tagName: 'li'
		initialize: ->
			#@render()
		render: =>
			imgSquareTemplate = ich.imgPinSquare(@model.toJSON())
			$(@el).html(imgSquareTemplate)
			@
		pinMe: ->
			alert 'PIN ME!'
			#$(@).effect("shake", {times: 3}, 300)
			console.log $(@)
		rockNRoll: ->
			#$(@).effect("shake", {times: 3}, 300)
			console.log $(@)
		events:
			'click button' :'pinMe'
			'hover' : 'rockNRoll'
	
	overLay = new OverLayView
	pins = SobsPins.fetchPins()
	console.log pins
	for pin in pins
		pinView = new SobsPinView model: pin
		$('ul#pinList').append(pinView.render().el)
		console.log pinView

	
	
		

