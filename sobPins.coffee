$(document).ready ->
	class SobsPin extends Backbone.Model
	class SobsPins extends Backbone.Collection
		model: SobsPin
	class SobsPinView extends Backbone.View
		el: $('#overlay')
		initialize: ->
			_.bindAll @
			@render()
		render: ->
			#@drawOverlay()
			imgSquareTemplate = ich.imgPinSquare(@model.toJSON())
			$(@el).append imgSquareTemplate
			@
		pinMe: ->
			alert 'PIN ME!'
		@drawOverlay: ->
			overModel =
				color: 'black'
				opacity: '0.5'
				top: $(document).scrollTop()
			overLay = ich.overLay(overModel.toJSON())
			console.log overLay
			$('body').append overLay
			


		events:
			'click button' :'pinMe'
			
	$('.separator > a').each(->
		sobsPin = new SobsPin(
			escapedUrl: encodeURIComponent(@href)
			imgUrl: @href
			altText: "Alt Text Coming Soon!"
			postUrl: "www.quietlikehorses.com"
		)
		pinView = new SobsPinView model: sobsPin
		)
	
	
		

