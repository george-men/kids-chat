require 'test_helper'

class KidsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get kids_index_url
    assert_response :success
  end

end
