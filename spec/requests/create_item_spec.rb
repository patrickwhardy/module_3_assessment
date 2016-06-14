# When I send a POST request to /api/v1/items with a name,
# description, and image_url I receive a 201 JSON response
# if the record is successfully created And I receive a JSON
# response containing the name, description,
# and image_url but not the created_at or updated_at
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
    expect(response.status).to eq 201

    item_json = JSON.parse(response.body)

    expect(item_json["id"]).to eq(item.id)
    expect(item_json["name"]).to eq(item.name)
    expect(item_json["description"]).to eq(item.description)
    expect(item_json["image_url"]).to eq(item.image_url)

    expect(item_json.keys).to eq(["id", "name", "description", "image_url"])
  end
end
