require 'test_helper'

class MedicoverVisitsWatchdogsControllerTest < ActionController::TestCase
  setup do
    @medicover_visits_watchdog = medicover_visits_watchdogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicover_visits_watchdogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicover_visits_watchdog" do
    assert_difference('MedicoverVisitsWatchdog.count') do
      post :create, medicover_visits_watchdog: { first_possible_appointment_date: @medicover_visits_watchdog.first_possible_appointment_date, medicover_visit_query_id: @medicover_visits_watchdog.medicover_visit_query_id }
    end

    assert_redirected_to medicover_visits_watchdog_path(assigns(:medicover_visits_watchdog))
  end

  test "should show medicover_visits_watchdog" do
    get :show, id: @medicover_visits_watchdog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicover_visits_watchdog
    assert_response :success
  end

  test "should update medicover_visits_watchdog" do
    patch :update, id: @medicover_visits_watchdog, medicover_visits_watchdog: { first_possible_appointment_date: @medicover_visits_watchdog.first_possible_appointment_date, medicover_visit_query_id: @medicover_visits_watchdog.medicover_visit_query_id }
    assert_redirected_to medicover_visits_watchdog_path(assigns(:medicover_visits_watchdog))
  end

  test "should destroy medicover_visits_watchdog" do
    assert_difference('MedicoverVisitsWatchdog.count', -1) do
      delete :destroy, id: @medicover_visits_watchdog
    end

    assert_redirected_to medicover_visits_watchdogs_path
  end
end
