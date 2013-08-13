class Chordnote < ActiveRecord::Base
	belongs_to :chord
	belongs_to :note
end
