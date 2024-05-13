class TownTrailsController < ApplicationController

  def index
    # binding.pry
    town = Town.find(params[:town_id])
    @trails = town.trails #instance variable so we can access in our view. .trails is the ARassociation
  end
end