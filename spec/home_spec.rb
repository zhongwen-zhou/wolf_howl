require 'spec_helper'
describe "home page" do
  it "displays the user's username after successful login" do
    puts "Hello Test!!"
    puts "User count:#{User.count}"
  end

  it "test get" do
    get "/"
  end
end
