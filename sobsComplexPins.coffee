$(document).ready ->
	class OverLay extends Backbone.Model
		defaults:
	        color: 'black',
	        opacity: '0.5',
	        top: 0
			height: 400
			width: 400	
	class OverLayView extends Backbone.View
		initialize: ->
			@render()
		render: =>
			overModel = new OverLay top: $(document).scrollTop()
			overLayTemplate = ich.overLay(overModel.toJSON());
			$('body').append(overLayTemplate);
			@
	class SobsPin extends Backbone.Model
		@sizeImage: (width, height, newWidth) ->
			console.log 'running size function!'
			ratio = height/width
			newHeight = ratio * newWidth
		
				
	class SobsPins extends Backbone.Collection
		model: SobsPin
		@fetchPins: =>
			console.log 'Fetch Pins Being Called!'
			pins = []
			$('.separator > a').each(->
				console.log "height:#{$(@).children('img').height()}"
				console.log "width:#{$(@).children('img').width()}"
				sobsPin = new SobsPin(
					escapedUrl: encodeURIComponent(@href)
					imgUrl: @href
					altText: "Alt Text Coming Soon!"
					postUrl: "www.quietlikehorses.com"
					width: 150
					height: SobsPin.sizeImage( $(@).children('img').height(), $(@).children('img').width(), 150)
				)
				console.log sobsPin
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
			alert JSON.stringify(@model.toJSON())
			$(@).children('img').effect("shake", {times: 3}, 300)
			$(@).hide("explode", 1000);
			console.log $(@).children('img')
		rockNRoll: ->
			#$(@).effect("shake", {times: 3}, 300)
			alert JSON.stringify(@model.toJSON())
			console.log $(@)
		events:
			'click button' :'pinMe'
			#'hover' : 'rockNRoll'
	
	overLay = new OverLayView
	console.log SobsPin.sizeImage(234,456,645)
	pins = SobsPins.fetchPins()
	console.log pins
	for pin in pins
		pinView = new SobsPinView model: pin
		$('ul#pinList').append(pinView.render().el)
		console.log pinView

	
	
		

