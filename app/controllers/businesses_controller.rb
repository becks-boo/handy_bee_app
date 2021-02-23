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

  def new
    @business = Business.new
    authorize @business
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user
    authorize @business

    if @business.save
      redirect_to business_path(@business)
    else
      render :new
    end
  end

  private

  def business_params
    params.require(:business).permit(:name, :description, :picture, :category, :qualification, :location, :language)
  end
end
