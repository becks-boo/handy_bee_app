class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
    # @businesses = Business.search(params[:search])
  end


  def show
    @business = Business.find(params[:id])
  end
end
