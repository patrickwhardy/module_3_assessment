class StoresController < ApplicationController
  def index
    @total = Store.total(params["search"])
    @stores = Store.create_stores(params["search"])
  end

  def show
    @store = Store.create_store_with_hours(params["id"])
  end
end
