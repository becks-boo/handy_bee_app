class BusinessesController < ApplicationController
  def index
    # @businesses = Business.all
    # @businesses = Business.search(params[:search])
    @businesses = policy_scope(Business)
    if params[:query].present?
      @businesses = Business.where(category: params[:query])
    else
      @businesses = Business.all
    end
  end


  def show
    @business = Business.find(params[:id])
    @bookings = @business.bookings
    authorize @business
  end

end
