require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get welcome" do
    get :welcome
    assert_response :success
  end

  test "should get product" do
    get :product
    assert_response :success
  end

  test "should get nutrition" do
    get :nutrition
    assert_response :success
  end

  test "should get privacy_policy" do
    get :privacy_policy
    assert_response :success
  end

  test "should get return_policy" do
    get :return_policy
    assert_response :success
  end

  test "should get subscribed" do
    get :subscribed
    assert_response :success
  end

  test "should get faq" do
    get :faq
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
