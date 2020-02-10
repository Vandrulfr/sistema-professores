require 'test_helper'

class SecControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sec_index_url
    assert_response :success
  end

end
