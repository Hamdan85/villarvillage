require 'test_helper'

class AjaxControllerTest < ActionController::TestCase
  test "should get artists" do
    get :artists
    assert_response :success
  end

end
