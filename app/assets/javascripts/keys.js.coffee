jQuery ->
	allChords = []
	allChordObjects = $('#addChordDiv').data('url')
	for index, chord of allChordObjects
		allChords.push(chord.name)
		console.log(allChords)
	$('#addChordField').autocomplete({
		source: allChords
		}).focus()