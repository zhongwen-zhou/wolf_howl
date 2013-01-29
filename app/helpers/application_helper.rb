module ApplicationHelper
	def is_login?
		session[:current_user_id].present?
	end
end
