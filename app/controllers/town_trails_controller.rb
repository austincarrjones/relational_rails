class TownTrailsController < ApplicationController

  def index
    @town = Town.find(params[:town_id])
    @trails = @town.trails #instance variable so we can access in our view. .trails is the ARassociation
  end

  # def new
  # end

  # def create
  #   binding.pry
  #   trail = @town.create!(name: params[:name])
  #   redirect_to "/towns/#{@town.id}/trails"
  # end
end