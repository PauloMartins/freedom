# Prepare
exports = window

# Init
exports.init = ->
	header()

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
			el = $(this)

			if el.val() is ''
				el.parent().find('label').show()

header = ->
	$('#header').animate
		top: 0