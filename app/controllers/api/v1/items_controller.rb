class Api::V1::ItemsController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Item.all
  end

  def show
    respond_with Item.find(params["id"])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      render :status => 201
      respond_with Item.find(@item.id)
    end
  end

  def destroy
    respond_with Item.destroy(params["id"])
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end
