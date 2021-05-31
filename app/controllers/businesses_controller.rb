class BusinessesController < ApplicationController
  skip_after_action :verify_authorized, only: :delete_image_attachment

  def index
    # @businesses = Business.all
    # @businesses = Business.search(params[:search])
    @users = User.all.includes(:businesses)
    @businesses = policy_scope(Business).includes(:users)
    # filter by category
    @languages = Language.all
    if params[:query].present?
      @businesses = Business.where(category: params[:query][:category_id]).includes(:languages, :reviews)
      # @businesses_count = @businesses.count

      if params[:language].present? && params[:rating].present?
        @businesses = Business.where(category: params[:query][:category_id]).includes(:reviews).where("reviews.rating" => params[:rating]).includes(:languages).where("languages.name" => params[:language])
      elsif params[:language].present?
        @businesses = Business.where(category: params[:query][:category_id]).includes(:languages).where("languages.name" => params[:language])
      elsif params[:rating].present?
        @businesses = Business.where(category: params[:query][:category_id]).includes(:reviews).where("reviews.rating" => params[:rating]).includes(:languages)
      end
    else
      @businesses = Business.all.includes(:reviews, :languages)
    end
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
    @business.contractor = current_user
    authorize @business

    if @business.save
      # @connect_lang = BusinessLanguage.create(business_id: @business.id, language_id: @language.id)
      redirect_to business_path(@business)
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
      if params[:business][:pictures].present?
          params[:business][:pictures].each do |picture|
            @business.pictures.attach(picture)
          end
      end
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

  def delete_image_attachment
    @business = Business.find(params[:business_id])

    attachment = @business.pictures.find(params[:picture_id])

    attachment.purge

    redirect_to edit_business_path(@business)
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
    params.require(:business).permit(:name, :description, :category, :qualification, :location, language_ids: [])
  end
end
