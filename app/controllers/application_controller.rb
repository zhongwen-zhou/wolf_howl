class ApplicationController < ActionController::Base
  # layout 'application'
  protect_from_forgery

  before_filter :current_user
  before_filter :authorize_login
  # before_filter :active_nav

  def is_login?
    session[:current_user_id].present?
  end


  private

  def current_user
  	return @current_user if @current_user.present?
  	return @current_user = session[:current_user_id].present? ? User.find(session[:current_user_id]) : User.guest_user
    # return @current_user = User.find(session[:current_user_id]) if session[:current_user_id].present?
  end

  def authorize_login
    access_token = cookies[:access_token]
    Rails.logger.info("---token:#{access_token}")
    if access_token.present?
      user = User.find_by_access_token(access_token)
      if user.present? && user.is_remember
        @current_user = user
        @current_user.sign_in(request.remote_ip)
        session[:current_user_id] = @current_user.id
        if @current_user.token_updated_at < (Time.now - 30.minute)
          cookies[:access_token] = @current_user.remember_me
        end
        return true
      end
    end
  	return redirect_to new_sessions_path unless @current_user.present?
  end

  # def active_nav(name)
  #   @active_nav = 'home'
  #   Rails.logger.info("===Con:#{name}")
  # end
end
