require "rails_helper"

RSpec.describe "DELETE /api/v1/items/:id" do
  it "deletes specified item" do
    Item.create(
      name: "Name",
      description: "Description",
      image_url: "Image"
    )
    expect(Item.count).to eq(1)
    item = Item.first

    delete "/api/v1/items/#{item.id}.json"
    expect(response.status).to eq 204

    expect(Item.count).to eq(0)
  end
end
