class ReviewsController < ApplicationController
  def new
    @review = Review.new
    authorize @review
  end
end
