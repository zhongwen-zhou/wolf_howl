class Activity < ActiveRecord::Base
  attr_accessible :address, :description, :end_date, :start_date, :status, :subject, :owner_id, :owner_type, :user_id
  belongs_to :owner, :polymorphic => :true
  belongs_to :user
end
