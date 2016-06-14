class StoresController < ApplicationController
  def index
    @total = Store.total(params["search"])
    @stores = Store.create_stores(params["search"])
  end

  def show
    @store = create_store(params["id"])
  end
end
