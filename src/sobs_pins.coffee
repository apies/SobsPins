window.SobsPinsApp = {}
(->
	
	SobsPinsApp.SobsPin  = Backbone.Model.extend(

		sizeImage: (width, height, newWidth) ->
			ratio = height/width
			newHeight = ratio * newWidth

		pinterestLinkify: ->
			"http://pinterest.com/pin/create/button/?url=#{@get('postUrl')}&media=#{@get('escapedUrl')}&description=#{@get('read quietlikehorses.com!')}"
	)

	SobsPinsApp.ImgPinView = Backbone.View.extend(

		render: ->
			source = $('#pinterestQLHImg').html()
			template = Handlebars.compile(source)
			context = @model.toJSON()
			$(@el).html('')
			$(@el).html(template(context))
			@delegateEvents()
			@

		events:
			"hover": "pinMe"
			"click": "pinMe"

		pinMe: ->
			pinterestLink = @model.pinterestLinkify()
			window.open(@model.pinterestLinkify())
			false
	)

	#private var used to initialize pins array
	pins = []
	SobsPinsApp.fetchPins = ->
		$('.separator > a').each(->
			console.log @href
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



		
			
		



	
	
		

