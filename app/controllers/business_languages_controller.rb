class BusinessLanguagesController < ApplicationController
  def new
    @languages = Language.all
    @business = Business.find(params[:business_id])
    @business_language = BusinessLanguage.new
    authorize @business_language
  end

  def create
    @business = Business.find(params[:business_id])
    @languages = Language.where(id:params[:business_language][:language])
    @languages.each do |l|
      @business_language = BusinessLanguage.new(business: @business, language: l)
      authorize @business_language
      @business_language.save
    end
    redirect_to business_path(@business)

    # if @business_language.save
    #   redirect_to new_business_path(@business)
    # else
    #   render :new
    # end
  end
end
