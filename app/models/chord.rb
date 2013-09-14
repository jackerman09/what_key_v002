class Chord < ActiveRecord::Base
	before_save { self.unique_name = name.upcase }

	belongs_to 	:user
	has_many	:chordnotes
	has_many	:notes, through: :chordnotes
	has_many	:keychords
	has_many 	:keys, through: :keychords

	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :name, presence: true

	def hasnote?(note)
		self.chordnotes.find_by(note_id: note.id)
	end

	def addnote!(note)
		self.chordnotes.create!(note_id: note.id)
	end
end
