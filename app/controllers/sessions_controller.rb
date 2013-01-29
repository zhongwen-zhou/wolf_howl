#encoding: utf-8
class SessionsController < ApplicationController
  layout 'personal'
  skip_filter :authorize_login
  def index
  end

  def new
  	@user = User.new
  end

  def create
  	user = User.new(params[:user])
  	@user = user.authorize_user
    if @user.present?
      @user.sign_in(request.remote_ip)
      session[:current_user_id] = @user.id
      if params[:user][:is_remember] == 'true'
        cookies[:access_token] = @user.remember_me
      else
        cookies[:access_token] = @user.canel_remember_me
      end
  		return redirect_to root_path
  	else
      @user = User.new
  		return redirect_to new_sessions_path, :notice => "用户名或密码错误！"
  	end
  end

  def destroy
    @current_user.remember_me
    session[:current_user_id] = nil
    return redirect_to root_path
  end
end
