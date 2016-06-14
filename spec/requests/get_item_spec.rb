require "rails_helper"

RSpec.describe "GET /api/v1/items/:id" do
  it "returns an item with name, description and image_url" do
    Item.create(
      name: "Name",
      description: "Description",
      image_url: "Image"
    )
    expect(Item.count).to eq(1)
    item = Item.first

    get "/api/v1/items/#{item.id}.json"
    expect(response.status).to eq 200

    item_json = JSON.parse(response.body)

    expect(item_json["id"]).to eq(item.id)
    expect(item_json["name"]).to eq(item.name)
    expect(item_json["description"]).to eq(item.description)
    expect(item_json["image_url"]).to eq(item.image_url)

    expect(item_json.keys).to eq(["id", "name", "description", "image_url"])
  end
end
