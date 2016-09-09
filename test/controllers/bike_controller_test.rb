require 'test_helper'

class BikeControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get bike_show_url
    assert_response :success
  end

  test "should get new" do
    get bike_new_url
    assert_response :success
  end

  test "should get create" do
    get bike_create_url
    assert_response :success
  end

  test "should get edit" do
    get bike_edit_url
    assert_response :success
  end

  test "should get update" do
    get bike_update_url
    assert_response :success
  end

  test "should get delete" do
    get bike_delete_url
    assert_response :success
  end

  test "should get destroy" do
    get bike_destroy_url
    assert_response :success
  end

end
