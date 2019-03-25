require 'test_helper'

class UtilityControllerTest < ActionDispatch::IntegrationTest
  test "should get upload_token" do
    get utility_upload_token_url
    assert_response :success
  end

end
