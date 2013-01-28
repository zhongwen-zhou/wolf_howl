class HomeController < ApplicationController
  # layout false
  skip_filter :authorize_login
  def index
  	@active_nav = 'home'
  end
end
