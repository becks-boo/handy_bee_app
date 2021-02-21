class ReviewsController < ApplicationController
  before_action :set_booking, except: [:edit, :update, :destroy]
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking_id = @booking.id
    @review.user_id = current_user.id
    authorize @review

    if @review.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    if @review.update(review_params)
      redirect_to booking_path(@review.booking)
    else
      render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    authorize @review
    redirect_to booking_path(@review.booking)
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
