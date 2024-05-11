class TownsController < ApplicationController

  def index
    @towns = Town.all.order(created_at: :asc)
    #binding.pry
  end

  def show
    # binding.pry
    @town = Town.find(params[:id])
  end
end