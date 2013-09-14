# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

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

