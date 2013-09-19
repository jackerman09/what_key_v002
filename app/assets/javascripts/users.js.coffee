jQuery ->
	toggleChords = (e) ->
		e.preventDefault()
		if $(@).text() == 'show chords'
			$(@).text('hide chords')
		else
			$(@).text('show chords')
		$(@).closest('li').find('.chordsholder').slideToggle()

	toggleNotes = (e) ->
		e.preventDefault()
		if $(@).text() == 'show notes'
			$(@).text('hide notes')
		else
			$(@).text('show notes')
		$(@).closest('li').find('.notesholder').slideToggle()

	$('.showremovechords').click toggleChords
	$('.showremovenotes').click toggleNotes

