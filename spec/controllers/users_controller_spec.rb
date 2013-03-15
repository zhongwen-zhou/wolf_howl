#encoding: utf-8
require 'spec_helper'

describe UsersController do

	it 'access the regeister user view!' do
		get :new
		response.code.should eq('200')
		response.should render_template('new')
		assigns(:user).should be_a_new(User)
	end

	context "regeister new user!" do

		it 'can not pass because user password is nil' do
			post :create, :user => {:email => '348281683@qq.com', :password => nil }
			assigns(:user).errors[:password].first.should eq("不能为空！")
			response.should render_template("new")
		end

		it 'can not pass because user password_confirmation is different with password' do
			post :create, :user => {:email => '348281683@qq.com', :password => 'tonytone', :password_confirmation => 'tony' }
			puts "#{assigns(:user).errors}"
			assigns(:user).errors.inspect should eq("不能为空！")
			response.should render_template("new")
		end		

	end

	it 'should be accessable' do
		post :create, :user => {:email => 'zhongwenzhou.wolf@gamil.com', :password => 'tonytone'}
		assigns(:user).nick_name.should eq(@test_user.nick_name)
		expect(response).to redirect_to("/")
	end	
end
