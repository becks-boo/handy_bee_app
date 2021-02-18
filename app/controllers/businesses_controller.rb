class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
    # @businesses = Business.search(params[:search])
  end

end
