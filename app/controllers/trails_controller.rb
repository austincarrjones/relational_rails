class TrailsController < ApplicationController
  
  def index
    @trails = Trail.all
  end

  def show
    @trail = Trail.find(params[:id])
  end

  def new
    # binding.pry
    @town = Town.find(params[:town_id])
  end

  def create
    # @town = Town.find(params[:town_id])
    Trail.create(name: params[:name], town_id: params[:town_id])
    # binding.pry
    redirect_to "/towns/#{params[:town_id]}/trails"
  end
end