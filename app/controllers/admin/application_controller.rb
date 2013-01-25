class Admin::ApplicationController < ActionController::Base
  layout 'admin'
  protect_from_forgery
  before_filter :current_user
  before_filter :authorize_login

  private

  def current_user
    Rails.logger.info("---session:#{session[:current_user_id]}")
  	return @current_user if @current_user.present?
  	return @current_user = User.find(session[:current_user_id]) if session[:current_user_id].present?
  end

  def authorize_login
  	return redirect_to new_session_path unless @current_user.present?
  end
end
