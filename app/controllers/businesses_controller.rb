class BusinessesController < ApplicationController
  def index
    # @businesses = Business.all
    # @businesses = Business.search(params[:search])
    @businesses = policy_scope(Business)
    # filter by category
    if params[:query].present?
      @businesses = Business.where(category: params[:query])
      @businesses_count = @businesses.count
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
