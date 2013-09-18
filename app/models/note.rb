class Note < ActiveRecord::Base
	before_save { self.unique_name = name.upcase }

	has_many :chordnotes
	has_many :chords, through: :chordnotes

	validates :name, presence: true
	validates :description, presence: true
end
