require 'test_helper'

class BudgetsControllerTest < ActionController::TestCase
  setup do
    @budget = budgets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:budgets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create budget" do
    assert_difference('Budget.count') do
      post :create, budget: { balance_sum: @budget.balance_sum, description: @budget.description, end_date: @budget.end_date, genre_id: @budget.genre_id, genre_type: @budget.genre_type, name: @budget.name, owner_id: @budget.owner_id, owner_type: @budget.owner_type, start_date: @budget.start_date, status: @budget.status, total_sum: @budget.total_sum, user_id: @budget.user_id, visable_status: @budget.visable_status }
    end

    assert_redirected_to budget_path(assigns(:budget))
  end

  test "should show budget" do
    get :show, id: @budget
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @budget
    assert_response :success
  end

  test "should update budget" do
    put :update, id: @budget, budget: { balance_sum: @budget.balance_sum, description: @budget.description, end_date: @budget.end_date, genre_id: @budget.genre_id, genre_type: @budget.genre_type, name: @budget.name, owner_id: @budget.owner_id, owner_type: @budget.owner_type, start_date: @budget.start_date, status: @budget.status, total_sum: @budget.total_sum, user_id: @budget.user_id, visable_status: @budget.visable_status }
    assert_redirected_to budget_path(assigns(:budget))
  end

  test "should destroy budget" do
    assert_difference('Budget.count', -1) do
      delete :destroy, id: @budget
    end

    assert_redirected_to budgets_path
  end
end
