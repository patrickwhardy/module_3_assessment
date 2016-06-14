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

    get "/api/v1/items.json"
    expect(response.status).to eq 200

    items_json = JSON.parse(response.body)
    item_json = items_json.first
    item = Item.first
    expect(item_json["id"]).to eq(item.id)
    expect(item_json["name"]).to eq(item.name)
    expect(item_json["description"]).to eq(item.description)
    expect(item_json["image_url"]).to eq(item.image_url)

    expect(item_json.keys).to eq(["id", "name", "description", "image_url"])
  end
end
