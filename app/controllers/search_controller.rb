class SearchController < ApplicationController

  def index
    response = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?limit=10&&api_key=#{ENV['NREL_KEY']}&format=JSON&location=80203&fuel_type=LPG,ELEC&radius=6.0")
    raw_fuel_stations = JSON.parse(response.body)["fuel_stations"]

    @fuel_stations = raw_fuel_stations.map do |fuel_station_info|
      FuelStation.create({
        name: fuel_station_info["station_name"],
        address: fuel_station_info["street_address"],
        fuel_type_code: fuel_station_info["fuel_type_code"],
        distance: fuel_station_info["distance"], #TODO distance is relative to current query??? Will keep as is for now
        access_times: fuel_station_info["access_days_time"]
      })
    end

  end

end
