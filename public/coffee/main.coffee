# Prepare
exports = window

# Init
exports.init = ->
	header()
	slider()

window.placeholder = ->
	form = $ 'form[name=login]'
	username = form.find("input[name='LoginForm[username]']")
	password = form.find("input[name='LoginForm[password]']")

	# show label when empty field
	if username.val() is ''
		username.parent().find('label').show()
	if password.val() is ''
		password.parent().find('label').show()

	# On label click
	form.find('label[data-placeholder=true]').click ->
		$(this).parent().find('input').focus()

	# On field focus
	form.find("input[name='LoginForm[username]'], input[name='LoginForm[password]']")
		.focus ->
			$(this).parent().find('label').hide()
			$(this).parent().find('.errorMessage').remove()
		.blur ->
			el = $ this

			if el.val() is ''
				el.parent().find('label').show()

header = ->
	$('#header').animate
		top: 0
	, 300, 'linear'

slider = ->
	photos = $ '.photos'

	photos.hover \
		-> photos.find('.controls').fadeIn('slow'),
		-> photos.find('.controls').fadeOut('slow')


	photos.find('.controls .prev, .controls .next').click (e) ->
		el = $ this
		goTo = 0

		if el.hasClass('next')
			goTo = -300
		
		photos.find('ul').stop().animate
			left: goTo

		e.preventDefault()