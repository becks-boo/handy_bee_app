class BusinessLanguagesController < ApplicationController
  def new
    @business = Business.find(params[:business_id])
    @business_language = BusinessLanguage.new
    authorize @business_language
  end

  def create
  end
end
