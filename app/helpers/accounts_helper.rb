#encoding: utf-8
module AccountsHelper
	def io_type_option(account)
		"<option value='#{Account::IO_TYPE_INCOME}'>收入</option><option value='#{Account::IO_TYPE_OUTCOME}'>支出</option>"
	end
end
