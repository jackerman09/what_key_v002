class Note < ActiveRecord::Base
	has_many :chordnotes
	has_many :chords, through: :chordnotes

	validates :name, presence: true
	validates :description, presence: true
end
