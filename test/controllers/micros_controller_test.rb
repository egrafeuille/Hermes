require 'test_helper'

class MicrosControllerTest < ActionController::TestCase
  setup do
    @micro = micros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:micros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create micro" do
    assert_difference('Micro.count') do
      post :create, micro: { meso_id: @micro.meso_id, name: @micro.name, notes: @micro.notes, volume: @micro.volume }
    end

    assert_redirected_to micro_path(assigns(:micro))
  end

  test "should show micro" do
    get :show, id: @micro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @micro
    assert_response :success
  end

  test "should update micro" do
    patch :update, id: @micro, micro: { meso_id: @micro.meso_id, name: @micro.name, notes: @micro.notes, volume: @micro.volume }
    assert_redirected_to micro_path(assigns(:micro))
  end

  test "should destroy micro" do
    assert_difference('Micro.count', -1) do
      delete :destroy, id: @micro
    end

    assert_redirected_to micros_path
  end
end
