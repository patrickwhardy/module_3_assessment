# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "17 Total Stores"
# And I should see exactly 15 results
# And I should see the long name, city, distance, phone number
# and store type for each of the 15 results
require "rails_helper"

RSpec.feature "User can search for stores by zip" do
  scenario "they go to root_path and search with 15 results" do
    visit root_path

    fill_in "Search", with: "80202"
    click_on("Find Stores")

    expect(current_path).to eq("/search")
    expect(page).to have_content("17 Total Stores")
    #test for specific store data
  end
end
