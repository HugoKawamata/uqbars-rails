require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get events" do
    get :events
    assert_response :success
  end

  test "should get card" do
    get :card
    assert_response :success
  end

  test "should get book" do
    get :book
    assert_response :success
  end

  test "should get join" do
    get :join
    assert_response :success
  end

  test "should get sponsors" do
    get :sponsors
    assert_response :success
  end

end
