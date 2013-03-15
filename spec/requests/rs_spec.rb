require 'spec_helper'
describe "home page" do
  it "displays the user's username after successful login" do
    get "/"
  end
end