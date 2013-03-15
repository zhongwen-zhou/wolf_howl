require 'spec_helper'

describe Personal::ActivitiesController do
      it 'should be accessable' do
        get :show, :id => 1
      end
end
