require 'test_helper'

class ExperienceDutiesControllerTest < ActionController::TestCase
  setup do
    @experience_duty = experience_duties(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:experience_duties)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create experience_duty" do
    assert_difference('ExperienceDuty.count') do
      post :create, experience_duty: { description: @experience_duty.description, experience_id: @experience_duty.experience_id }
    end

    assert_redirected_to experience_duty_path(assigns(:experience_duty))
  end

  test "should show experience_duty" do
    get :show, id: @experience_duty
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @experience_duty
    assert_response :success
  end

  test "should update experience_duty" do
    patch :update, id: @experience_duty, experience_duty: { description: @experience_duty.description, experience_id: @experience_duty.experience_id }
    assert_redirected_to experience_duty_path(assigns(:experience_duty))
  end

  test "should destroy experience_duty" do
    assert_difference('ExperienceDuty.count', -1) do
      delete :destroy, id: @experience_duty
    end

    assert_redirected_to experience_duties_path
  end
end
