#encoding: utf-8
class Budget < ActiveRecord::Base
  attr_accessible :balance_sum, :description, :end_date, :genre_id, :genre_type, :name, :owner_id, :owner_type, :start_date, :status, :total_sum, :user_id, :visable_status
  validates :name, :total_sum, :presence => { :message => "不能为空！"}
  belongs_to :owner, :polymorphic => :true
  belongs_to :genre, :polymorphic => :true
  belongs_to :user
end
