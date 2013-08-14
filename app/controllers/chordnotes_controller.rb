class ChordnotesController < ApplicationController
  def show
  	@chordnote = Chordnote.find(params[:id])
  end

  def create
  	@chord = Chord.find(params[:chordnote][:chord_id])
  	@note = Note.find(params[:chordnote][:note_id])
  	@chord.addnote!(@note)
  	redirect_to @chord
  end

  def new
  	@chordnote = Chordnote.new
  end

  def destroy
  end

 #  def create
 #    @user = User.find(params[:relationship][:followed_id])
 #    current_user.follow!(@user)
 #    redirect_to @user
 #  end

 #  def destroy
 #    @user = Relationship.find(params[:id]).followed
 #    current_user.unfollow!(@user)
 #    redirect_to @user
	# end
end
