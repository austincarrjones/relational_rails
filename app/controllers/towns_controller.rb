class TownsController < ApplicationController

  def index
    @towns = Town.all.order(created_at: :asc)
    #binding.pry
  end

  def show
    @town = Town.find(params[:id])
    # binding.pry
  end
end