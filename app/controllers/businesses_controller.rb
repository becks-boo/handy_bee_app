class BusinessesController < ApplicationController
  def index
    # @businesses = Business.all
    # @businesses = Business.search(params[:search])
    @businesses = policy_scope(Business)
    # filter by category
    if params[:query].present?
      @businesses = Business.where(category: params[:query])
      # @businesses_count = @businesses.count

      if params[:language].present? && params[:rating].present?
        @businesses = Business.where(language: params[:language], category: params[:query]).includes(:reviews).where("reviews.rating" => params[:rating])
      elsif params[:language].present?
        @businesses = Business.where(language: params[:language], category: params[:query])
      elsif params[:rating].present?
        @businesses = Business.includes(:reviews).where("reviews.rating" => params[:rating])
      end
    else
      @businesses = Business.all
    end

    if params[:language].present?
      @businesses = Business.where(language: params[:language])
      # @businesses_count = @businesses.count
    end

    if params[:rating].present?
      @businesses = Business.includes(:reviews).where("reviews.rating" => params[:rating])
    end

    # if params[:rating].present?
    #   @businesses = Business.includes(:reviews).where("reviews.rating" => params[:rating])
    # end


    # filter_language
  end

  def show
    @business = Business.find(params[:id])
    @bookings = @business.bookings
    @chatrooms = Chatroom.all
    @review = Review.new
    authorize @business
  end

  def new
    @business = Business.new
    @languages = Language.all
    authorize @business
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user
    authorize @business
    # @language =

    if @business.save
      # @connect_lang = BusinessLanguage.create(business_id: @business.id, language_id: @language.id)
      redirect_to new_business_business_language_path(@business)
    else
      render :new
    end
  end

  def edit
    @business = Business.find(params[:id])

    authorize @business
  end

  def update
    @business = Business.find(params[:id])

    if @business.update(business_params)
      redirect_to @business, notice: "Business was succesfully updated."
    else
      render :edit
    end

    authorize @business
  end

  def destroy
    @business = Business.find(params[:id])

    authorize @business
    @business.destroy
    redirect_to account_path
  end

  private

  def filter_language
    @languages = []
    @businesses.each do |b|
      @languages << b.language
    end
    @languages_uniq = @languages.uniq
  end

  def business_params
    params.require(:business).permit(:name, :description, :category, :qualification, :location, language_ids: [], pictures: [])
  end
end
