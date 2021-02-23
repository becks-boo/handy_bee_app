class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
    # @businesses = Business.search(params[:search])
    @businesses = policy_scope(Business)
  end


  def show
<<<<<<< HEAD
    puts "Holisito k tal"
=======
    # raise
>>>>>>> main
    @business = Business.find(params[:id])
    @bookings = @business.bookings
    authorize @business
  end

  def category
    @business = Business.find(params[:category])
  end
end
