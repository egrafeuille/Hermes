require 'test_helper'

class MacrosControllerTest < ActionController::TestCase
  setup do
    @macro = macros(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:macros)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create macro" do
    assert_difference('Macro.count') do
      post :create, macro: { endDate: @macro.endDate, name: @macro.name, notes: @macro.notes, startDate: @macro.startDate, volume: @macro.volume }
    end

    assert_redirected_to macro_path(assigns(:macro))
  end

  test "should show macro" do
    get :show, id: @macro
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @macro
    assert_response :success
  end

  test "should update macro" do
    patch :update, id: @macro, macro: { endDate: @macro.endDate, name: @macro.name, notes: @macro.notes, startDate: @macro.startDate, volume: @macro.volume }
    assert_redirected_to macro_path(assigns(:macro))
  end

  test "should destroy macro" do
    assert_difference('Macro.count', -1) do
      delete :destroy, id: @macro
    end

    assert_redirected_to macros_path
  end
end
