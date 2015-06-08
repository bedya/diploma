require 'test_helper'

class PosdsControllerTest < ActionController::TestCase
  setup do
    @posd = posds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create posd" do
    assert_difference('Posd.count') do
      post :create, posd: { body: @posd.body, publish_date: @posd.publish_date, title: @posd.title, user_id: @posd.user_id }
    end

    assert_redirected_to posd_path(assigns(:posd))
  end

  test "should show posd" do
    get :show, id: @posd
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @posd
    assert_response :success
  end

  test "should update posd" do
    patch :update, id: @posd, posd: { body: @posd.body, publish_date: @posd.publish_date, title: @posd.title, user_id: @posd.user_id }
    assert_redirected_to posd_path(assigns(:posd))
  end

  test "should destroy posd" do
    assert_difference('Posd.count', -1) do
      delete :destroy, id: @posd
    end

    assert_redirected_to posds_path
  end
end
