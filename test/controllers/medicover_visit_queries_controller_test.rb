require 'test_helper'

class MedicoverVisitQueriesControllerTest < ActionController::TestCase
  setup do
    @medicover_visit_query = medicover_visit_queries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicover_visit_queries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicover_visit_query" do
    assert_difference('MedicoverVisitQuery.count') do
      post :create, medicover_visit_query: { booking_type: @medicover_visit_query.booking_type, clinic: @medicover_visit_query.clinic, doctor: @medicover_visit_query.doctor, is_set_because_promote_specialization: @medicover_visit_query.is_set_because_promote_specialization, language: @medicover_visit_query.language, period_of_the_day: @medicover_visit_query.period_of_the_day, region: @medicover_visit_query.region, search_for_next_since: @medicover_visit_query.search_for_next_since, search_since: @medicover_visit_query.search_since, set_because_of_pcc: @medicover_visit_query.set_because_of_pcc, specialization: @medicover_visit_query.specialization }
    end

    assert_redirected_to medicover_visit_query_path(assigns(:medicover_visit_query))
  end

  test "should show medicover_visit_query" do
    get :show, id: @medicover_visit_query
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicover_visit_query
    assert_response :success
  end

  test "should update medicover_visit_query" do
    patch :update, id: @medicover_visit_query, medicover_visit_query: { booking_type: @medicover_visit_query.booking_type, clinic: @medicover_visit_query.clinic, doctor: @medicover_visit_query.doctor, is_set_because_promote_specialization: @medicover_visit_query.is_set_because_promote_specialization, language: @medicover_visit_query.language, period_of_the_day: @medicover_visit_query.period_of_the_day, region: @medicover_visit_query.region, search_for_next_since: @medicover_visit_query.search_for_next_since, search_since: @medicover_visit_query.search_since, set_because_of_pcc: @medicover_visit_query.set_because_of_pcc, specialization: @medicover_visit_query.specialization }
    assert_redirected_to medicover_visit_query_path(assigns(:medicover_visit_query))
  end

  test "should destroy medicover_visit_query" do
    assert_difference('MedicoverVisitQuery.count', -1) do
      delete :destroy, id: @medicover_visit_query
    end

    assert_redirected_to medicover_visit_queries_path
  end
end
