class KeychordsController < ApplicationController
  def create
  	@key = Key.find(params[:keychord][:key_id])
  	@chord = Chord.find(params[:keychord][:chord_id])
  	if @key.haschord?(@chord)
  		# Add error message here, have it not redirect
  		redirect_to @key
  	else
  		@key.addchord!(@chord)
  		redirect_to @key
  	end
  end

  def destroy
    @chord = Note.find(params[:chord_id])
    @key = Key.find(params[:key_id])

	Keychord.find_by(chord_id: @chord.id, key_id: @key.id).destroy
  	redirect_to key_path(@key)
  end
end
