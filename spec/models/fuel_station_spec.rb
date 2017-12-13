require "rails_helper"

describe FuelStation do
  context "Instance Variables" do
    context ".search()" do
      it "returns an array of 10 Fuel Station objects" do
        result = FuelStation.search("80203")

        expect(result.count).to eq(10)
        expect(result.first).to be_a FuelStation
        expect(result.first.name).to eq("UDR")
        expect(result.last.name).to eq("City of Denver - Wellington E Webb Municipal Building")
      end
    end

  end
end
