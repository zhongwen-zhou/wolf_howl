#encoding: utf-8
module AccountsHelper
	def io_type_option(account)
		"<option value='#{Account::IO_TYPE_INCOME}'>收入</option><option value='#{Account::IO_TYPE_OUTCOME}'>支出</option>"
	end

	def statistics_type_help
		"<option value='in_out_type'>收支类别</option><option value='category_type'>帐务类别</option><option value='activity_type'>活动类别</option><option value='budget_type'>预算类别</option>"
	end

	def paid_user_option(group,activity)
		options = ''
		if activity.present?
			activity.users.each do |user|
				options += "<option value='#{user.id}'>#{user.nick_name}</option>"
			end
		else
			group.users.each do |user|
				options += "<option value='#{user.id}'>#{user.nick_name}</option>"
			end
		end
		return options
	end
end
