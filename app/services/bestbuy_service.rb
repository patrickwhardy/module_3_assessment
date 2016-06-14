class BestbuyService
  def initialize
    @connection = Faraday.new(url: "http://api.bestbuy.com/v1/")
  end

  def get_stores(zip)
    JSON.parse(@connection.get("stores(area(#{zip},25))?format=json&show=storeId,storeType,name&pageSize=2&apiKey=#{ENV['best_buy_key']}").body)
  end
end
