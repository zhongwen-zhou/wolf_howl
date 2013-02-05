#encoding: utf-8
class Budget < ActiveRecord::Base
  attr_accessible :balance_sum, :description, :end_date, :genre_id, :genre_type, :name, :owner_id, :owner_type, :start_date, :status, :total_sum, :user_id, :visable_status, :genre
  validates :name, :total_sum, :presence => { :message => "不能为空！"}
  belongs_to :owner, :polymorphic => :true
  belongs_to :genre, :polymorphic => :true
  belongs_to :user
  has_many :accounts, :as => :genre, :dependent => :destroy

  VISABLE_STATUS_PUBLIC = 0
  VISABLE_STATUS_FRIENDLY = 1
  VISABLE_STATUS_GROUP = 2
  VISABLE_STATUS_PRIVATE = 3

  VISABLE_STATUS = {VISABLE_STATUS_PUBLIC => '公开的', VISABLE_STATUS_FRIENDLY => '仅朋友可见', VISABLE_STATUS_GROUP => '小组可见', VISABLE_STATUS_PRIVATE => '私人的'}

end
