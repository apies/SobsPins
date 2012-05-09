$(document).ready ->
	overModel =
		color: 'black'
		opacity: '0.5'
		top: $(document).scrollTop()
	overLay = ich.overLay(overModel.toJSON())
	console.log overLay
	$('body').append overLay

	