class ChordnotesController < ApplicationController
  # def show
  # 	@chordnote = Chordnote.find(params[:id])
  # end

  def create
  	@chord = Chord.find(params[:chordnote][:chord_id])
  	# @note = Note.find(params[:chordnote][:note_id])
    @note = Note.find_by(name: params[:chordnote][:note_id].upcase)
  	if @note != nil
      if @chord.hasnote?(@note)
    		flash[:error] = "Note already in chord."
    		redirect_to @chord
    	else
    		@chord.addnote!(@note)
    		redirect_to @chord
    	end
    else
      flash[:error] = "Note does not exist."
      redirect_to @chord
    end
  end

  # def new
  # 	@chordnote = Chordnote.new
  # end

  def destroy
    @note = Note.find(params[:note_id])
    @chord = Chord.find(params[:chord_id])

		Chordnote.find_by(note_id: @note.id, chord_id: @chord.id).destroy
  	redirect_to chord_path(@chord)
  end
end
