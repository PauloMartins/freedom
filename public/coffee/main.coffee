window.placeholder = ->
	form = $ 'form[name=login]'

	# On label click
	form.find('label[data-placeholder=true]').click ->
		$(this).parent().find('input').focus()

	# On field focus
	form.find("input[name='LoginForm[username]'], input[name='LoginForm[password]']")
		.focus ->
			$(this).parent().find('label').hide()
		.blur ->
			el = $(this)

			if el.val() is ''
				el.parent().find('label').show()