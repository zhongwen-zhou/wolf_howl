#encoding: utf-8
class Account < ActiveRecord::Base
  attr_accessible :budget_id, :budget_type, :io_type, :owner_id, :owner_type, :remark, :sum, :visable_status, :genre, :user_id
  belongs_to :owner, :polymorphic => :true
  belongs_to :genre, :polymorphic => :true
  belongs_to :activity

  IO_TYPE_INCOME = 0
  IO_TYPE_OUTCOME = 1

  IO_TYPE = {IO_TYPE_INCOME => '收入', IO_TYPE_OUTCOME => '支出'}

  scope :income, where(:io_type => IO_TYPE_INCOME)
  scope :outcome, where(:io_type => IO_TYPE_OUTCOME)
end
