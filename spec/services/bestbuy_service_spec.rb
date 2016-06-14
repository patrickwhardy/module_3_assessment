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

  it "gets store hours by id" do
    service = BestbuyService.new
    stores_json = service.get_store_hours()
  end
end
