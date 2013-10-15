window.SobsPinsApp = {}
(->
	
	SobsPinsApp.SobsPin  = Backbone.Model.extend(
		#initialize: (data) ->

		sizeImage: (width, height, newWidth) ->
			ratio = height/width
			newHeight = ratio * newWidth
	)

	SobsPinsApp.ImgPinView = Backbone.View.extend(
		render: ->
			source = $('#pinterestQLHImg').html()
			template = Handlebars.compile(source)
			context = @model.toJSON()
			$(@el).html(template(context))
			@
	)

	#private var used to initialize pins array
	pins = []
	SobsPinsApp.fetchPins = ->
		$('.separator > a').each(->
			sobsPin = new SobsPinsApp.SobsPin(
				escapedUrl: encodeURIComponent(@href)
				imgUrl: @href
				altText: "Alt Text Coming Soon!"
				postUrl: "www.quietlikehorses.com"
				height: $(@).children('img').height()
				width: $(@).children('img').width()
			)
			console.log sobsPin.toJSON()
			new SobsPinsApp.ImgPinView(el: $(@), model: sobsPin).render()
		)

)()
$(document).ready ->
	SobsPinsApp.fetchPins()



		
			
		



	
	
		

