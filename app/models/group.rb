#encoding: utf-8
class Group < ActiveRecord::Base
  attr_accessible :description, :following_count, :level, :member_count, :name, :status, :user_id, :visable_status
  validates :name, :presence => { :message => "圈子名称不能为空！"}
  validates :name, :uniqueness => { :message => "该圈子名称已注册，请重新输入！" }
  has_many :activities, :as => :owner, :dependent => :destroy
  has_many :group_users, :dependent => :destroy
  has_many :users, :through => :group_users
  has_many :accounts, :as => :owner, :dependent => :destroy
  has_many :budgets, :as => :owner, :dependent => :destroy
  belongs_to :user

  def create_activity(params)
    activity = self.activities.create(params)
  end

  def create_budget(params,user,activity = nil)
    params = params.merge!({:user_id => user.id})
    params = params.merge!({:genre => activity}) if activity.present?
    budget = self.budgets.create(params)
  end

  def first?
    Group.first == self
  end

  def last?
    Group.last == self
  end
end
