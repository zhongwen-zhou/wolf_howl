class Category < ActiveRecord::Base
  attr_accessible :description, :level, :name, :postion, :status, :user_id, :parent_id
  belongs_to :user
end
