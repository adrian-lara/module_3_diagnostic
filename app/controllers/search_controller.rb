class SearchController < ApplicationController

  def index
    @fuel_stations = FuelStation.search(params[:q])
  end

end
