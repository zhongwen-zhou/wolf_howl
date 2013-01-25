class HomeController < ApplicationController
  # layout false
  skip_filter :authorize_login
  def index
  end
end
