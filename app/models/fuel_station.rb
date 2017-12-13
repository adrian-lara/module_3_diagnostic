class FuelStation

  attr_reader :name, :address, :fuel_type_code, :distance, :access_times

  def self.search(query_param)
    raw_fuel_stations = FuelStationService.retrieve_stations(query_param)

    raw_fuel_stations.map do |fuel_station_info|
      FuelStation.new({
        name: fuel_station_info["station_name"],
        address: fuel_station_info["street_address"],
        fuel_type_code: fuel_station_info["fuel_type_code"],
        distance: fuel_station_info["distance"],
        access_times: fuel_station_info["access_days_time"]
      })
    end
  end

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @fuel_type_code = info[:fuel_type_code]
    @distance = info[:distance]
    @access_times = info[:access_times]
  end

end
