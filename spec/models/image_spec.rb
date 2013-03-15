require 'spec_helper'

describe Image do
  pending "add some examples to (or delete) #{__FILE__}"
  pending "col:#{Image.column_names}"

  it "should delete a company" do
	  i = Image.new
	  expect(i.file_name).to eq('ok!')
	# expect { click_link "Delete Company" }.to change{Company.count}.by(-1)
  end
end
