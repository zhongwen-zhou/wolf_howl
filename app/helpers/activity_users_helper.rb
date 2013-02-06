module ActivityUsersHelper
	def visable_status_option
		options_str = ""
		Activity::VISABLE_STATUS.each do |value,name|
			options_str += "<option value='#{value}'>#{name}</option>"
		end
		return options_str
	end
end
