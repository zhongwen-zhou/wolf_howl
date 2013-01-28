#encoding: utf-8
class Account < ActiveRecord::Base
  attr_accessible :budget_id, :budget_type, :io_type, :owner_id, :owner_type, :remark, :sum, :visable_status
  belongs_to :owner, :polymorphic => :true
  belongs_to :genre, :polymorphic => :true
  belongs_to :activity
end
