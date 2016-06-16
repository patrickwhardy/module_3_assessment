require "rails_helper"

RSpec.describe BestbuyService do
  it "makes connection" do
    service = BestbuyService.new
    expect(service.class).to eq(BestbuyService)
  end

  it "gets stores by zip" do
    service = BestbuyService.new
    stores_json = service.get_stores("80202")
    expect(stores_json["total"]).to eq(17)
    expect(stores_json["stores"].count).to eq(15)

    store = stores_json["stores"].first

    expect(store["longName"]).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
    expect(store["city"]).to eq("Denver")
    expect(store["distance"]).to eq(3.25)
    expect(store["phone"]).to eq("303-270-9189")
    expect(store["storeType"]).to eq("Mobile")
  end

  it "gets store with hour" do
    service = BestbuyService.new
    store_json = service.get_store_with_hours(2740)["stores"][0]
    expect(store_json["hours"]).to eq("Mon: 10-9; Tue: 10-9; Wed: 10-9; Thurs: 10-9; Fri: 10-9; Sat: 10-9; Sun: 11-6")
    expect(store_json["longName"]).to eq("Best Buy Mobile - Cherry Creek Shopping Center")
    expect(store_json["city"]).to eq("Denver")
    expect(store_json["storeType"]).to eq("Mobile")
    expect(store_json["address"]).to eq("3000 East First Ave")
    expect(store_json["postalCode"]).to eq("80206")
    expect(store_json["region"]).to eq("CO")
  end
end
