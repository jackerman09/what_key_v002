# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

		admin = User.create({name: 'Jason Ackerman', email: 'jackerman09@gmail.com', password: 'password', password_confirmation: 'password', admin: true})
		user = User.create({name: 'Jessica Smagler', email: 'jbsmags@aol.com', password: 'password', password_confirmation: 'password'})

notes = Note.create([
		{name: 'Ab', description: 'Ab'},
		{name: 'A', description: 'A'},
		{name: 'Bb', description: 'Bb'},
		{name: 'B', description: 'B'},
		{name: 'C', description: 'C'},
		{name: 'Db', description: 'Db'},
		{name: 'D', description: 'D'},
		{name: 'Eb', description: 'Eb'},
		{name: 'E', description: 'E'},
		{name: 'F', description: 'F'},
		{name: 'Gb', description: 'Gb'},
		{name: 'G', description: 'G'}
	])

chords = Chord.create([
		{name: 'Ab', description: 'Ab'},
		{name: 'A', description: 'A'},
		{name: 'Bb', description: 'Bb'},
		{name: 'B', description: 'B'},
		{name: 'C', description: 'C'},
		{name: 'Db', description: 'Db'},
		{name: 'D', description: 'D'},
		{name: 'Eb', description: 'Eb'},
		{name: 'E', description: 'E'},
		{name: 'F', description: 'F'},
		{name: 'Gb', description: 'Gb'},
		{name: 'G', description: 'G'}
	])

keys = Key.create([
		{name: 'C', description: 'C Major'},
		{name: 'Cm', description: 'C Minor'}
	])

chordnotes = Chordnote.create([
		{note_id: Note.find_by(name: 'A').id, chord_id: Chord.find_by(name: 'C').id},
		{note_id: Note.find_by(name: 'B').id, chord_id: Chord.find_by(name: 'C').id},
		{note_id: Note.find_by(name: 'C').id, chord_id: Chord.find_by(name: 'C').id},
		{note_id: Note.find_by(name: 'D').id, chord_id: Chord.find_by(name: 'C').id},
		{note_id: Note.find_by(name: 'E').id, chord_id: Chord.find_by(name: 'C').id},
		{note_id: Note.find_by(name: 'F').id, chord_id: Chord.find_by(name: 'C').id},
		{note_id: Note.find_by(name: 'G').id, chord_id: Chord.find_by(name: 'C').id},
	])

keychords = Keychord.create([
		{chord_id: Chord.find_by(name: 'C').id, key_id: Chord.find_by(name: 'C').id}
	])