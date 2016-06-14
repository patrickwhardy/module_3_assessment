class Store < OpenStruct
  attr_reader :total

  def self.service
    BestbuyService.new
  end

  def self.create_stores(zip)
    stores_json = service.get_stores(zip)["stores"]
    stores_json.map { |store_data| Store.new(store_data) }
  end

  def self.create_store_hours(id)
    service.get_store_hours(id)["stores"][0]["hours"]
  end

  def self.total(zip)
    service.get_stores(zip)["total"]
  end
end
