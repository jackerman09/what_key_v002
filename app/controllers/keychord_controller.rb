class KeychordController < ApplicationController
  def show
   	@keychord = Keychord.find(params[:id])
   end

  def create
  	@key = Key.find(params[:keychord][:key_id])
  	# @chord = Chord.find(params[:keychord][:chord_id])
    @chord = Chord.find_by(name: params[:keychord][:chord_id])
  	if @note != nil
      if @key.haschord?(@chord)
    		flash[:error] = "Chord already in key."
    		redirect_to @key
    	else
    		@key.addchord!(@chord)
    		redirect_to @key
    	end
    else
      flash[:error] = "Chord does not exist."
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
