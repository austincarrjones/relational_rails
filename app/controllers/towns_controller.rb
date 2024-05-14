class TownsController < ApplicationController

  def index
    @towns = Town.all.order(created_at: :asc)
  end

  def show
    @town = Town.find(params[:id])
  end

  def new
  end

  def create
    # binding.pry
    town = Town.create(name: params[:name], population: params[:population])
    redirect_to "/towns"
  end
end