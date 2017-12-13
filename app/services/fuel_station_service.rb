class FuelStationService

  def self.retrieve_stations(query_param)
    response = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?limit=10&&api_key=#{ENV['NREL_KEY']}&format=JSON&location=#{query_param}&fuel_type=LPG,ELEC&radius=6.0")
    JSON.parse(response.body)["fuel_stations"]
  end

end
