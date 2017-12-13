require 'rails_helper'


describe "When a user visits the root, fills in the search form with 80203, and clicks locate" do
  it "the user should see a list of the 10 closest stations (and their information) within 6 miles sorted by distance limited to Electric and Propane" do
    visit '/'

    fill_in "q", with: "80203"
    click_on "Locate"

    expect(current_path).to eq(search_path)

    expect(page).to have_content("Stations (10)")

    expect(page).to have_content("UDR")
    expect(page).to have_content("800 Acoma St")
    expect(page).to have_content("ELEC")
    expect(page).to have_content("0.31422 miles")
    expect(page).to have_content("24 hours daily")

    expect(page).to have_content("City of Denver - Wellington E Webb Municipal Building")
    expect(page).to have_content("202 W Colfax Ave")
    expect(page).to have_content("ELEC")
    expect(page).to have_content("0.77306 miles")
    expect(page).to have_content("Employee use only")

    expect(page).not_to have_content("BD")
    expect(page).not_to have_content("CNG")
    expect(page).not_to have_content("E85")
    expect(page).not_to have_content("HY")
    expect(page).not_to have_content("LNG")
  end
end
