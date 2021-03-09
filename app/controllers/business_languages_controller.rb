class BusinessLanguagesController < ApplicationController
  before_action :set_chatroom
  def new
    @languages = Language.all
    @business = Business.find(params[:business_id])
    @business_language = BusinessLanguage.new
    authorize @business_language
  end

  def create
    @business = Business.find(params[:business_id])
    authorize @business
    @languages = Language.where(id:params[:business_language][:language_id])
    @languages.each do |l|
      @business_language = BusinessLanguage.new(business: @business, language: l)
      @business_language.save
    end
    redirect_to business_path(@business)

    # if @business_language.save
    #   redirect_to new_business_path(@business)
    # else
    #   render :new
    # end
  end

  def set_chatroom
    @chatroom = policy_scope(Chatroom).first
  end
end
