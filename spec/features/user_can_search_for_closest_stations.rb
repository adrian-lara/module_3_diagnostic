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

    expect(page).to have_content("Stations (10)")
    # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
    expect(page).to have_content("UDR")
    expect(page).to have_content("800 Acoma St")
    expect(page).to have_content("Electric")
    expect(page).to have_content("0.31422 miles")
    expect(page).to have_content("24 hours daily")

    expect(page).to have_content("City of Denver - Wellington E Webb Municipal Building")
    expect(page).to have_content("202 W Colfax Ave")
    expect(page).to have_content("Electric")
    expect(page).to have_content("0.77306 miles")
    expect(page).to have_content("Employee use only")
    # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

    expect(page).not_to have_content("Biodiesel (B20 and above)")
    expect(page).not_to have_content("Compressed Natural Gas")
    expect(page).not_to have_content("Ethanol (E85)")
    expect(page).not_to have_content("Hydrogen")
    expect(page).not_to have_content("Liquefied Natural Gas")
    # And the stations should be limited to Electric and Propane
  end
end
