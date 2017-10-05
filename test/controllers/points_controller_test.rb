require 'test_helper'

class PointsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get points_index_url
    assert_response :success
  end

  test "should get import" do
    get points_import_url
    assert_response :success
  end

end
