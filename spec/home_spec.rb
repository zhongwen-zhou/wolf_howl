require 'spec_helper'
describe "home page" do
  it "displays the user's username after successful login" do
    user = User.create!(:nick_name => "Tony", :password => "tony")
    get "/login"
    assert_select "form.login" do
      assert_select "input[name=?]", "username"
      assert_select "input[name=?]", "password"
      assert_select "input[type=?]", "submit"
    end

    post "/login", :username => "jdoe", :password => "secret"
    assert_select ".header .username", :text => "jdoe"
  end
end
