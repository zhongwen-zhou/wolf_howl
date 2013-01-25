class Group < ActiveRecord::Base
  attr_accessible :description, :following_count, :level, :member_count, :name, :status, :user_id
  belongs_to :user
end
