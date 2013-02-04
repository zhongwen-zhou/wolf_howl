class HomeController < Personal::ApplicationController
  # layout false
  skip_filter :authorize_login
  skip_filter :redirect_guest_view
  def index
  	@active_nav = 'home'
  end
end
