require 'test_helper'

class CriteriaControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:criteria)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create criterion" do
    assert_difference('Criterion.count') do
      post :create, :criterion => { }
    end

    assert_redirected_to criterion_path(assigns(:criterion))
  end

  test "should show criterion" do
    get :show, :id => criteria(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => criteria(:one).to_param
    assert_response :success
  end

  test "should update criterion" do
    put :update, :id => criteria(:one).to_param, :criterion => { }
    assert_redirected_to criterion_path(assigns(:criterion))
  end

  test "should destroy criterion" do
    assert_difference('Criterion.count', -1) do
      delete :destroy, :id => criteria(:one).to_param
    end

    assert_redirected_to criteria_path
  end
end
