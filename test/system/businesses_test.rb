require "application_system_test_case"

class BusinessesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit businesses_url

    save_and_open_screenshot
    assert_selector "h1", text: "Fix your house"
  end
end
