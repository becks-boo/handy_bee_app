class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end

  def show
    @businesses = Business.find(params[:id])
  end
end
