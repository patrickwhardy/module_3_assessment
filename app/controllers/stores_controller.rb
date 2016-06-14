class StoresController < ApplicationController
  def index
    @total = Store.total(params["search"])
    @stores = Store.create_stores(params["search"])
    binding.pry
  end

  def show
    @store = create_store(params["id"])
  end
end
