require 'test_helper'

class CentralControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get central_index_url
    assert_response :success
  end

end
