require 'erb'
require 'ostruct'

class ListsController < ApplicationController
  helper_method :test, :get_binding

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_detail_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  def test(list)
    @cl_image_path = "<%= cl_image_path list.photo.key %>"
    @asset_path = "<%= asset_path('movie_theater.jpg') %>"
    if list.photo.key
      template = ERB.new(@cl_image_path)
    else
      ERB.new(@asset_path)
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
