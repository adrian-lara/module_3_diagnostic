class FuelStation

  attr_reader :name, :address, :fuel_type_code, :distance, :access_times

  def initialize(info)
    @name = info["name"]
    @address = info["address"]
    @fuel_type_code = info["fuel_type_code"]
    @distance = info["distance"]
    @access_times = info["access_times"]
  end

end
