require "rails_helper"

RSpec.feature "User can navigate to store#show from search" do
  scenario "they search, click on name and view store name, store type and address with city, state, zip and hours" do
    visit root_path

    fill_in "search", with: "80202"
    click_on("Find Stores")

    click_on("Best Buy Mobile - Cherry Creek Shopping Center")

    expect(current_path).to eq("/stores/#{store.id}")

    expect(page).to have_content(store.name)
    expect(page).to have_content(store.type)
    expect(page).to have_content(store.address2)

    #store hours
  end
end
