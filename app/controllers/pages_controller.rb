class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :set_chatroom

  def home
    @users = User.all
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

  def set_chatroom
    @chatroom = policy_scope(Chatroom).first
  end

end
