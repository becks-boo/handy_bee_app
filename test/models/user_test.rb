require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user_name returns user_name" do
    user = User.new(user_name: "Jordan")
    assert_equal "Jordan", user.user_name
  end
end
