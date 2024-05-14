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
    town = Town.create(name: params[:name], population: params[:population], year_round_riding: params[:year_round_riding])
    redirect_to "/towns"
  end
end