$ ->
	$('#tweet_text').keyup ->
		if $(this).val().length > 0
			$('#add_tweet').removeClass 'disabled'
			$('#counter').html(140 - $(this).val().length)
		else
			$('#add_tweet').addClass 'disabled'
			$('#counter').html(140);
		return
	return