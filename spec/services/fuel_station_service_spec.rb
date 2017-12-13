require 'rails_helper'

describe FuelStationService do
  context "Instance Variables" do
    context ".retrieve_stations" do
      it "returns an array of fuel station information hashes" do
        result = FuelStationService.retrieve_stations("80203")

        expect(result.count).to eq(10)
        expect(result.first).to be_a Hash
        expect(result.first["station_name"]).to eq("UDR")
        expect(result.last["station_name"]).to eq("City of Denver - Wellington E Webb Municipal Building")
      end
    end
  end

end
