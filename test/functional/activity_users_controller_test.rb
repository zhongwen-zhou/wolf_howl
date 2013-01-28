require 'test_helper'

class ActivityUsersControllerTest < ActionController::TestCase
  setup do
    @activity_user = activity_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_user" do
    assert_difference('ActivityUser.count') do
      post :create, activity_user: { activity_id: @activity_user.activity_id, invitees_id: @activity_user.invitees_id, is_admin: @activity_user.is_admin, status: @activity_user.status, user_id: @activity_user.user_id }
    end

    assert_redirected_to activity_user_path(assigns(:activity_user))
  end

  test "should show activity_user" do
    get :show, id: @activity_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_user
    assert_response :success
  end

  test "should update activity_user" do
    put :update, id: @activity_user, activity_user: { activity_id: @activity_user.activity_id, invitees_id: @activity_user.invitees_id, is_admin: @activity_user.is_admin, status: @activity_user.status, user_id: @activity_user.user_id }
    assert_redirected_to activity_user_path(assigns(:activity_user))
  end

  test "should destroy activity_user" do
    assert_difference('ActivityUser.count', -1) do
      delete :destroy, id: @activity_user
    end

    assert_redirected_to activity_users_path
  end
end
