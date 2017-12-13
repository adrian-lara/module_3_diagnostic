require 'rails_helper'


describe "When a user visits the root, fills in the search form with 80203, and clicks locate" do
  it "the user should see a list of the 10 closest stations (and their information) within 6 miles sorted by distance limited to Electric and Propane" do
    # As a user
    visit '/'
    # When I visit "/"

    fill_in "form_name", with: "80203"
    # And I fill in the search form with 80203

    click_on "Locate"
    # And I click "Locate"

    expect(current_path).to eq(search_path)
    # Then I should be on page "/search" with parameters visible in the url

    expect(page).to have_content()
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    # And the stations should be limited to Electric and Propane
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
  end
end
