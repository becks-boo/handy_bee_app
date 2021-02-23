class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
    # @businesses = Business.search(params[:search])
    @businesses = policy_scope(Business)
  end


  def show
    @business = Business.find(params[:id])
    @bookings = @business.bookings
    authorize @business
  end

end
