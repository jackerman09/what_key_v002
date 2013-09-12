class Key < ActiveRecord::Base
	belongs_to :user
	has_many	:keychords
	has_many 	:chords, through: :keychords

	default_scope -> { order('created_at DESC') }
	validates :user_id, presence: true
	validates :name, presence: true

	def haschord?(chord)
		self.keychords.find_by(chord_id: chord.id)
	end

	def addchord!(chord)
		self.keychords.create!(chord_id: chord.id)
	end
end
