require "rails_helper"

RSpec.describe BestbuyService do
  it "makes connection" do
    service = BestbuyService.new
    expect(service.class).to eq(BestbuyService)
  end

  it "gets stores by zip" do
    service = BestbuyService.new
    stores = service.get_stores("80202")
    binding.pry
    expect(stores["total"]).to eq(17)
    # count, And I should see the long name, city, distance, phone number
    # and store type
  end
end
