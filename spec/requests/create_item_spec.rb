require "rails_helper"

RSpec.describe "POST /api/v1/items" do
  it "creates an item" do
    expect(Item.count).to eq(0)

    params = {item: {
      name: "Name",
      description: "Description",
      image_url: "Image"
    }}

    post "/api/v1/items.json", params

    expect(Item.count).to eq(1)
    item = Item.last
    item_json = JSON.parse(response.body)

    expect(item_json["id"]).to eq(item.id)
    expect(item_json["name"]).to eq(item.name)
    expect(item_json["description"]).to eq(item.description)
    expect(item_json["image_url"]).to eq(item.image_url)

    expect(item_json.keys).to eq(["id", "name", "description", "image_url"])
  end
end
