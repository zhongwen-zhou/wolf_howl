require 'spec_helper'
describe "routing to profiles" do
  it "routes /profile/:username to profile#show for username" do
    expect(:get => "/").to route_to(
      :controller => "home",
      :action => "index"
    )
  end

  it "does not expose a list of profiles" do
    expect(:get => "/profiles").not_to be_routable
  end
end