class InfosController < ApplicationController
  def new
    @info = Info.new
  end

  def create
    @info = Info.new(info_params)
    if @info.save
      #@display_message = "Object created successfully, thank you!"
      flash[:notice] = "Object created successfully, thank you!"
    else
      #@display_message = "Object didn't create successfully."
      flash[:notice] = "Object didn't create successfully."
      render 'new'
    end
  end
  
  private
  def info_params
    params.require(:info).permit(:title, :price)
  end
end
