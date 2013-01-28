class Account < ActiveRecord::Base
  attr_accessible :budget_id, :budget_type, :io_type, :owner_id, :owner_type, :remark, :sum
  belongs_to :owner, :polymorphic => :true
  belongs_to :activity
end
