jQuery ->
	allNotes = [
		"A",
		"B",
		"C",
		"C Minor",
		"D",
		"E",
		"F",
		"G"
	]
	$('#addnote').autocomplete({
		source: allNotes
		})