# When I send a GET request to /api/v1/items I receive a 200 JSON
# response containing all items And each item has a name, description,
#  and image_url but not the created_at or updated_at
require "rails_helper"

RSpec.describe "GET /api/v1/items" do
  it "returns all items with name, description and image_url" do
    5.times do |n|
      Item.create(
        name: "Name #{n}",
        description: "Description #{n}",
        image_url: "Image #{n}"
      )
    end
    expect(Item.count).to eq(5)

    get "/api/v1/items"
    expect(response.status).to eq 200

    items_json = JSON.parse(response.body)
    
  end
end
