class Chord < ActiveRecord::Base
	belongs_to 	:user
	has_many	:chordnotes
	has_many	:notes, through: :chordnotes

	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :name, presence: true
end
