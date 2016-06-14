require "rails_helper"

RSpec.feature "User can navigate to store#show from search" do
  scenario "they search, click on name and view store name, store type and address with city, state, zip and hours" do
    visit root_path

    fill_in "search", with: "80202"
    click_on("Find Stores")

    click_on("Best Buy Mobile - Cherry Creek Shopping Center")

    expect(current_path).to eq("/stores/2740")

    expect(page).to have_content("Best Buy Mobile - Cherry Creek Shopping Center")
    expect(page).to have_content("Mobile")
    expect(page).to have_content("3000 East First Ave")
    expect(page).to have_content("Denver")
    expect(page).to have_content("CO")


    expect(page).to have_content("Mon: 10-9; Tue: 10-9; Wed: 10-9; Thurs: 10-9; Fri: 10-9; Sat: 10-9; Sun: 11-6")
  end
end
