require 'spec_helper'

describe User do

  it "should pass user auth" do
	  u = User.last
	  expect(u.authorize_user).to eq(User.first)
  end
end
