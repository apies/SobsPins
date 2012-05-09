$(document).ready ->
	class OverLay extends Backbone.Model
		defaults:
	        color: 'black',
	        opacity: '0.5',
	        top: $(document).scrollTop()
			
	class OverLayView extends Backbone.View
		initialize: ->
			@render()
		render: =>
			overModel = new OverLay
			overLayTemplate = ich.overLay(overModel.toJSON());
			$('body').append(overLayTemplate);
			@
	class SobsPin extends Backbone.Model
		@fetchPins: =>
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
			
	class SobsPins extends Backbone.Collection
		model: SobsPin
	class SobsPinView extends Backbone.View
		el: $('#overlayPin')
		initialize: ->
			#@render()
		render: =>
			imgSquareTemplate = ich.imgPinSquare(@model.toJSON())
			$(@el).append imgSquareTemplate
			#$('#overlay').append imgSquareTemplate
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
	#$('.separator > a').each(->
	#	sobsPin = new SobsPin(
	#		escapedUrl: encodeURIComponent(@href)
	#		imgUrl: @href
	#		altText: "Alt Text Coming Soon!"
	#		postUrl: "www.quietlikehorses.com"
	#	)
	#	pinView = new SobsPinView model: sobsPin
	#	pinview.render()
	#	)
	
	
		

