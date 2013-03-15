require 'spec_helper'

describe SessionsController do

	before(:each) do
		@test_user = User.last
	end	

	it 'should be new' do
		get :new
		response.should render_template("new")
	end

	it 'should be accessable' do
		post :create, :user => {:email => 'zhongwenzhou.wolf@gamil.com', :password => 'tonytone'}
		assigns(:user).nick_name.should eq(@test_user.nick_name)
		expect(response).to redirect_to("/")
	end	
end
