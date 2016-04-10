require 'test_helper'

class FillingsControllerTest < ActionController::TestCase
  setup do
    @filling = fillings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fillings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create filling" do
    assert_difference('Filling.count') do
      post :create, filling: { name: @filling.name, price: @filling.price, spicy: @filling.spicy }
    end

    assert_redirected_to filling_path(assigns(:filling))
  end

  test "should show filling" do
    get :show, id: @filling
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @filling
    assert_response :success
  end

  test "should update filling" do
    patch :update, id: @filling, filling: { name: @filling.name, price: @filling.price, spicy: @filling.spicy }
    assert_redirected_to filling_path(assigns(:filling))
  end

  test "should destroy filling" do
    assert_difference('Filling.count', -1) do
      delete :destroy, id: @filling
    end

    assert_redirected_to fillings_path
  end
end
