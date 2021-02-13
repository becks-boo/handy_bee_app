class BusinessesController < ApplicationController
  def index
    @businesses = Business.all
  end
end
