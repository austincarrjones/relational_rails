class TownsController < ApplicationController

  def index
    @towns = Town.all.order(created_at: :asc) #how to make this work from the model?
  end

  def create
    Town.create(name: params[:name], population: params[:population], year_round_riding: params[:year_round_riding])
    redirect_to "/towns"
  end

  def show
    @town = Town.find(params[:id])
  end

  def new
  end

  def edit
    @town = Town.find(params[:id])
  end

  def update
    @town = Town.find(params[:id])
    @town.update(name: params[:name], population: params[:population], year_round_riding: params[:year_round_riding])
    redirect_to "/towns/#{@town.id}"
  end

  # def town_params
  #   params.permit(:name, :population, :year_round_riding)
  # end
end