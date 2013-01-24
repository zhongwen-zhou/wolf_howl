require 'test_helper'

class AccountsControllerTest < ActionController::TestCase
  setup do
    @account = accounts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accounts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
      post :create, account: { budget_id: @account.budget_id, budget_type: @account.budget_type, io_type: @account.io_type, owner_id: @account.owner_id, owner_type: @account.owner_type, remark: @account.remark, sum: @account.sum }
    end

    assert_redirected_to account_path(assigns(:account))
  end

  test "should show account" do
    get :show, id: @account
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @account
    assert_response :success
  end

  test "should update account" do
    put :update, id: @account, account: { budget_id: @account.budget_id, budget_type: @account.budget_type, io_type: @account.io_type, owner_id: @account.owner_id, owner_type: @account.owner_type, remark: @account.remark, sum: @account.sum }
    assert_redirected_to account_path(assigns(:account))
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete :destroy, id: @account
    end

    assert_redirected_to accounts_path
  end
end
