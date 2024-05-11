class TownTrailsController < ApplicationController

  def index
    town = Town.find(params[:town_id])
    binding.pry
    @trails = town.trails #instance variable so we can access in our view. .trails is the ARassociation
  end
end