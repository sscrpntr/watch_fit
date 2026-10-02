require "application_system_test_case"

class WatchesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit watches_index_url

    assert_selector "h1", text: "Watch Fit"
  end
end
