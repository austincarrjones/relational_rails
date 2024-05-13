class TownsController < ApplicationController

  def index
    @towns = Town.all.order(created_at: :asc)
  end

  def show
    @town = Town.find(params[:id])
  end
end