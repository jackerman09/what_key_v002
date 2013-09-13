class KeysController < ApplicationController
  def index
    @keys = Key.paginate(page: params[:page])
  end

  def show
    @key = Key.find(params[:id])
  end

  def new
  	@key = Key.new
  end

  def create
    @key = current_user.keys.new(key_params)
    if @key.save
      flash[:success] = "Key added."
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
    Key.find(params[:id]).destroy
    flash[:success] = "Key removed."
    redirect_to current_user
  end

  
  private

  	def key_params
      params.require(:key).permit(:name, :description)
    end
end
