class NotesController < ApplicationController
  def index
  	@notes = Note.paginate(page: params[:page])
  end

  def show
  	@note = Note.find(params[:id])
  end

  def new
  	@note = Note.new
  end

  def create
  	@note = Note.new(note_params)
    if @note.save
      flash[:success] = "Note added."
      redirect_to notes_path
    else
      render 'new'
    end
  end

	def destroy
    Note.find(params[:id]).destroy
    flash[:success] = "Note removed."
  end

  
  private

  	def note_params
      params.require(:note).permit(:name, :description)
    end  
end
