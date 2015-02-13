require 'test_helper'

class MedicoverApisControllerTest < ActionController::TestCase
  setup do
    @medicover_api = medicover_apis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicover_apis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicover_api" do
    assert_difference('MedicoverApi.count') do
      post :create, medicover_api: { new_visit_path: @medicover_api.new_visit_path, token: @medicover_api.token, url: @medicover_api.url }
    end

    assert_redirected_to medicover_api_path(assigns(:medicover_api))
  end

  test "should show medicover_api" do
    get :show, id: @medicover_api
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicover_api
    assert_response :success
  end

  test "should update medicover_api" do
    patch :update, id: @medicover_api, medicover_api: { new_visit_path: @medicover_api.new_visit_path, token: @medicover_api.token, url: @medicover_api.url }
    assert_redirected_to medicover_api_path(assigns(:medicover_api))
  end

  test "should destroy medicover_api" do
    assert_difference('MedicoverApi.count', -1) do
      delete :destroy, id: @medicover_api
    end

    assert_redirected_to medicover_apis_path
  end
end
