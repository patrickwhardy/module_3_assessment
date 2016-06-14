class StoresController < ApplicationController
  def index
    @total = Store.total(params["search"])
    @stores = Store.create_stores(params["search"])
  end

  def show
    @store_data = params["store_data"]
    @hours = Store.create_store_hours(params["id"])
  end
end
