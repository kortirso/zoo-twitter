$ ->
	$('#tweet_text').keyup ->
		if $(this).val().length > 0
			$('#add_tweet').removeClass 'disabled'
		else
			$('#add_tweet').addClass 'disabled'
		return
	return