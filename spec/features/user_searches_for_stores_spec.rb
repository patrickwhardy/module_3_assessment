require "rails_helper"

RSpec.feature "User can search for stores by zip" do
  scenario "they go to root_path and search with 15 results" do
    visit root_path

    fill_in "search", with: "80202"
    click_on("Find Stores")

    expect(current_path).to eq("/search")
    expect(page).to have_content("17 Total Stores")

    expect(page).to have_content(
        "Long Name: Best Buy Mobile - Cherry Creek Shopping Center
        City: Denver
        Distance: 3.25
        Phone Number: 303-270-9189
        Store Type: Mobile
        Long Name: Best Buy - Belmar
        City: Lakewood
        Distance: 5.28
        Phone Number: 303-742-8039
        Store Type: BigBox
        Long Name: Best Buy - Colorado Blvd
        City: Denver
        Distance: 5.61
        Phone Number: 303-758-5805
        Store Type: BigBox
        Long Name: Best Buy - Denver West
        City: Lakewood
        Distance: 8.38
        Phone Number: 303-273-5617
        Store Type: BigBox
        Long Name: Best Buy - Westminster
        City: Westminster
        Distance: 8.54
        Phone Number: 303-426-4434
        Store Type: BigBox
        Long Name: Best Buy Mobile - Colorado Mills
        City: Lakewood
        Distance: 8.59
        Phone Number: 303-278-0601
        Store Type: Mobile
        Long Name: Best Buy - Northglenn
        City: Denver
        Distance: 9.12
        Phone Number: 303-252-8677
        Store Type: BigBox
        Long Name: Best Buy Mobile - Town Center at Aurora
        City: Aurora
        Distance: 9.66
        Phone Number: 303-326-0848
        Store Type: Mobile
        Long Name: Best Buy - Aurora
        City: Aurora
        Distance: 9.83
        Phone Number: 303-338-5797
        Store Type: BigBox
        Long Name: Best Buy - Littleton
        City: Littleton
        Distance: 10.45
        Phone Number: 303-932-7830
        Store Type: BigBox
        Long Name: Best Buy - Southglenn
        City: Centennial
        Distance: 11.0
        Phone Number: 303-797-3246
        Store Type: BigBox
        Long Name: Best Buy - I70 & Tower Rd
        City: Aurora
        Distance: 11.73
        Phone Number: 303-373-9284
        Store Type: BigBox
        Long Name: Best Buy Mobile - Flatiron Crossing Mall
        City: Broomfield
        Distance: 14.44
        Phone Number: 303-466-8624
        Store Type: Mobile
        Long Name: Best Buy - S.E. Denver
        City: Lone Tree
        Distance: 14.98
        Phone Number: 303-649-9474
        Store Type: BigBox
        Long Name: Best Buy - S.E. Aurora
        City: Aurora
        Distance: 18.51
        Phone Number: 303-693-0166
        Store Type: BigBox")
  end
end
