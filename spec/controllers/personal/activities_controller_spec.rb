require 'spec_helper'

describe Personal::ActivitiesController do
      it 'should be accessable' do
      	@current_user = User.last
        get :index
      end
end
