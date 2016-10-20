require 'test_helper'

class ProtuctsLotsControllerTest < ActionController::TestCase
  setup do
    @protucts_lot = protucts_lots(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:protucts_lots)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create protucts_lot" do
    assert_difference('ProtuctsLot.count') do
      post :create, protucts_lot: { due_date: @protucts_lot.due_date, lot_number: @protucts_lot.lot_number, production_date: @protucts_lot.production_date, quantity: @protucts_lot.quantity, sanitary_registry: @protucts_lot.sanitary_registry }
    end

    assert_redirected_to protucts_lot_path(assigns(:protucts_lot))
  end

  test "should show protucts_lot" do
    get :show, id: @protucts_lot
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @protucts_lot
    assert_response :success
  end

  test "should update protucts_lot" do
    patch :update, id: @protucts_lot, protucts_lot: { due_date: @protucts_lot.due_date, lot_number: @protucts_lot.lot_number, production_date: @protucts_lot.production_date, quantity: @protucts_lot.quantity, sanitary_registry: @protucts_lot.sanitary_registry }
    assert_redirected_to protucts_lot_path(assigns(:protucts_lot))
  end

  test "should destroy protucts_lot" do
    assert_difference('ProtuctsLot.count', -1) do
      delete :destroy, id: @protucts_lot
    end

    assert_redirected_to protucts_lots_path
  end
end
