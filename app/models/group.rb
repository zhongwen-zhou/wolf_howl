#encoding: utf-8
class Group < ActiveRecord::Base
  attr_accessible :description, :following_count, :level, :member_count, :name, :status, :user_id
  validates :name, :presence => { :message => "圈子名称不能为空！"}
  validates :name, :uniqueness => { :message => "该圈子名称已注册，请重新输入！" }
  has_many :activities, :as => :owner
  has_many :group_users
  has_many :users, :through => :group_users
  has_many :accounts
  belongs_to :user

  def create_activity(params)
    activity = self.activities.create(params)
  end
end
