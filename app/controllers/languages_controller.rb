class LanguagesController < ApplicationController
  # Do we need the index method?
  # def index
  #   @languages = Language.all
  # end

  def new
    @language = Language.new
  end

  def create
    @language = Language.new(language_params)
    authorize @language
    # Not finished
  end

  private

  def language_params
    params.require(:language).permit(:name)
  end
end
