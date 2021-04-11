class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @users = User.all.includes(:businesses)
    find_categories
  end

  def components
  end

  def account
    @user = current_user
  end

  def my_businesses
    @businesses = Business.where(user_id: current_user)
  end

  private

  def find_categories
    categories = []
    @users.each do |u|
      u.businesses.each do |b|
        categories << b.category
      end
    end
    categories_unique = categories.uniq
  end

end
