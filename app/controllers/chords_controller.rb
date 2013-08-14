class ChordsController < ApplicationController
  def index
  	@chords = Chord.paginate(page: params[:page])
  end

  def show
  	@chord = Chord.find(params[:id])
    @notes = @chord.notes
  end

  def new
  	@chord = Chord.new
  end

  def create
  	@chord = current_user.chords.new(chord_params)
    if @chord.save
      flash[:success] = "Chord added."
      redirect_to current_user
    else
      render 'new'
    end
  end

	def destroy
    Chord.find(params[:id]).destroy
    flash[:success] = "Chord removed."
    redirect_to chords_path
  end

  def hasnotes
    @title = "Notes"
    @chord = Chord.find(params[:id])
    @chords = @chord.notes.paginate(page: params[:page])
    render 'chord_path'
  end

  
  private

  	def chord_params
      params.require(:chord).permit(:name, :description)
    end  
end
