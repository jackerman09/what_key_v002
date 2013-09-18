jQuery ->
	allNotes = []
	allNoteObjects = $('#addNoteDiv').data('url')
	for index, note of allNoteObjects
		allNotes.push(note.name)
	$('#addNoteField').autocomplete({
		source: allNotes
		}).focus()