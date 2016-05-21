require 'test_helper'

class EducationAccomplishmentsControllerTest < ActionController::TestCase
  setup do
    @education_accomplishment = education_accomplishments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:education_accomplishments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create education_accomplishment" do
    assert_difference('EducationAccomplishment.count') do
      post :create, education_accomplishment: { description: @education_accomplishment.description, education_id: @education_accomplishment.education_id }
    end

    assert_redirected_to education_accomplishment_path(assigns(:education_accomplishment))
  end

  test "should show education_accomplishment" do
    get :show, id: @education_accomplishment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @education_accomplishment
    assert_response :success
  end

  test "should update education_accomplishment" do
    patch :update, id: @education_accomplishment, education_accomplishment: { description: @education_accomplishment.description, education_id: @education_accomplishment.education_id }
    assert_redirected_to education_accomplishment_path(assigns(:education_accomplishment))
  end

  test "should destroy education_accomplishment" do
    assert_difference('EducationAccomplishment.count', -1) do
      delete :destroy, id: @education_accomplishment
    end

    assert_redirected_to education_accomplishments_path
  end
end
