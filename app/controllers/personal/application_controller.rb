class Personal::ApplicationController < ApplicationController
  layout 'personal'

  before_filter :redirect_guest_view

  private

  def redirect_guest_view
  	unless is_login?
  		Rails.logger.info("======Guest,con:#{params}")
  		return render "#{params[:controller]}/guest/#{params[:action]}"
  	end
  end

end
