require "application_system_test_case"

class BusinessesTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit root_url

  #   # save_and_open_screenshot
  #   assert_selector "h1", text: "Fix your house"
  # end
  test "lets a signed in user view all bussiness" do
    login_as users(:george)
    visit "/businesses"
    save_and_open_screenshot
  end
end
