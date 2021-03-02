class BusinessLanguagesController < ApplicationController
  def new
    @business = Business.find(params[:business_id])
    @business_language = BusinessLanguage.new
    authorize @business_language
  end

  def create
    # @languages = Language.all
    @business = Business.find(params[:business_id])
    @business_language = BusinessLanguage.new(business_language_params)
    authorize @business_language

    if @business_language.save
      redirect_to new_business_path(@business)
    else
      render :new
    end
  end

  private

  # def business_language_params
  #   params.require(:language).permit(:name)
  # end
end
