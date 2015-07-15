require 'test_helper'

class MesosControllerTest < ActionController::TestCase
  setup do
    @meso = mesos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mesos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create meso" do
    assert_difference('Meso.count') do
      post :create, meso: { macro_id: @meso.macro_id, name: @meso.name, notes: @meso.notes, volume: @meso.volume }
    end

    assert_redirected_to meso_path(assigns(:meso))
  end

  test "should show meso" do
    get :show, id: @meso
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @meso
    assert_response :success
  end

  test "should update meso" do
    patch :update, id: @meso, meso: { macro_id: @meso.macro_id, name: @meso.name, notes: @meso.notes, volume: @meso.volume }
    assert_redirected_to meso_path(assigns(:meso))
  end

  test "should destroy meso" do
    assert_difference('Meso.count', -1) do
      delete :destroy, id: @meso
    end

    assert_redirected_to mesos_path
  end
end
