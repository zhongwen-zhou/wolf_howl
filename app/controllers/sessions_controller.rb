#encoding: utf-8
class SessionsController < ApplicationController
  layout false
  skip_filter :authorize_login
  def index
  end

  def new
  	@user = User.new
  end

  def create
  	user = User.new(params[:user])
  	@user = user.authorize_user
  	Rails.logger.info("===----user:#{@user.inspect}")
  	if @user.present?
  		session[:current_user_id] = @user.id
  		return redirect_to root_path
  	else
  		return render :action => :new, :notice => "用户名或密码错误！"
  	end
  end
end
