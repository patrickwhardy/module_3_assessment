class Api::V1::ItemsController < ApplicationController
  respond_to :json, :html

  def index
    respond_with Item.all
  end

  def show

  end

  def create

  end

  def destroy

  end
end