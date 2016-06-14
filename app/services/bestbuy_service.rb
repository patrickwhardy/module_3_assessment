class BestbuyService
  def initialize
    @connection = Faraday.new(url: "http://api.bestbuy.com/v1/")
  end

  def get_stores(zip)
    JSON.parse(@connection.get("stores(area(#{zip},25))?format=json&show=longName,city,distance,phone&pageSize=15&apiKey=#{ENV['best_buy_key']}").body)
  end
end
