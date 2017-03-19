require 'test_helper'

class MatchesControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get accept" do
    get matches_controller_accept_url
    assert_response :success
  end

end
