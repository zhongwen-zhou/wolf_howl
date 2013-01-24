require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { access_token: @user.access_token, brief_introduction: @user.brief_introduction, current_sign_in_at: @user.current_sign_in_at, current_sign_in_ip: @user.current_sign_in_ip, email: @user.email, follower_count: @user.follower_count, following_count: @user.following_count, group_count: @user.group_count, last_sign_in_at: @user.last_sign_in_at, last_sign_in_ip: @user.last_sign_in_ip, nick_name: @user.nick_name, password: @user.password, sign_in_count: @user.sign_in_count, status: @user.status, token_updated_at: @user.token_updated_at }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { access_token: @user.access_token, brief_introduction: @user.brief_introduction, current_sign_in_at: @user.current_sign_in_at, current_sign_in_ip: @user.current_sign_in_ip, email: @user.email, follower_count: @user.follower_count, following_count: @user.following_count, group_count: @user.group_count, last_sign_in_at: @user.last_sign_in_at, last_sign_in_ip: @user.last_sign_in_ip, nick_name: @user.nick_name, password: @user.password, sign_in_count: @user.sign_in_count, status: @user.status, token_updated_at: @user.token_updated_at }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
