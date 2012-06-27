$(document).ready ->
	
	class OverLay extends Backbone.Model
		defaults:
	        color: 'black'
	        opacity: '0.5'
	        top: 0
			height: 400
			width: 400	
	class OverLayView extends Backbone.View
		initialize: ->
			@render()
		render: =>
			overModel = new OverLay #top: $(document).scrollTop()
			overLayTemplate = ich.overLay(overModel.toJSON());
			console.log overLayTemplate
			$('body').append(overLayTemplate);
			@
	class SobsPin extends Backbone.Model
		@sizeImage: (width, height, newWidth) ->
			ratio = height/width
			newHeight = ratio * newWidth
		
				
	class SobsPins extends Backbone.Collection
		model: SobsPin
		@fetchPins: ->
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
					height: SobsPin.sizeImage( $(@).children('img').width(), $(@).children('img').height(), 150)
				)
				pins.push sobsPin
				)
			pins
		
			
		
	class SobsPinView extends Backbone.View
		tagName: 'li'
		className: 'photoPin'
		initialize: ->
			#@render()
		render: =>
			imgSquareTemplate = ich.imgPinSquare(@model.toJSON())
			$(@el).html(imgSquareTemplate)
			@
		pinMe: ->
			console.log $(@el)
			$(@el).effect("shake", {times: 3}, 300)
			$(@el).hide("explode", 1000)
			@

		rockNRoll: ->
			#$(@).effect("shake", {times: 3}, 300)
			alert JSON.stringify(@model.toJSON())
			console.log $(@)
			@
		events:
			'click button' :'pinMe'
			#'hover' : 'rockNRoll'
	
	$('.post-footer').each(->
		$(@).append '<img src="http://passets-lt.pinterest.com/images/about/buttons/big-p-button.png" width="60" height="60" alt="Follow Me on Pinterest" />'
		$(@).click(->
			overLay = new OverLayView
			pins = SobsPins.fetchPins()
			for pin in pins
				pinView = new SobsPinView model: pin
				$('ul#pinList').append(pinView.render().el)
			)
		)	
	


	
	
		

