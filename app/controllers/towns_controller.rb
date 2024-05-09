class TownsController < ApplicationController

  def index
    @towns = Town.all
  end

  def show
    # binding.pry
    @town = Town.find(params[:id])
  end
end