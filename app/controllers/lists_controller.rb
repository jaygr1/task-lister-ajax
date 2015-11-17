class ListsController < ApplicationController 
  
  def index
    @list = List.new
    @lists = List.all
  end

  def create
    @list = List.create(list_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to root_path
  end

  private
    def list_params
      params.require(:list).permit(:title)
    end

end