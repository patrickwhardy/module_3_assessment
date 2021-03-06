class BestbuyService
  def initialize
    @connection = Faraday.new(url: "http://api.bestbuy.com/v1/")
  end

  def get_stores(zip)
    JSON.parse(@connection.get("stores(area(#{zip},25))?format=json&show=storeId,address,region,postalCode,longName,city,distance,phone,storeType&pageSize=15&apiKey=#{ENV['best_buy_key']}").body)
  end

  def get_store_with_hours(id)
    JSON.parse(@connection.get("stores(storeId=#{id})?format=json&show=hours,longName,storeType,address,city,region,postalCode&apiKey=#{ENV['best_buy_key']}").body)
  end
end
