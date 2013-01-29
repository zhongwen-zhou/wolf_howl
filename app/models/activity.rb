#encoding: utf-8
class Activity < ActiveRecord::Base
  attr_accessible :address, :description, :end_date, :start_date, :status, :subject, :owner_id, :owner_type, :user_id
  validates  :subject, :presence => { :message => "不能为空！"}
  belongs_to :owner, :polymorphic => :true
  belongs_to :user
  has_many :accounts, :as => :owner, :dependent => :destroy
  has_many :budgets, :as => :genre, :dependent => :destroy
  has_many :activity_users, :dependent => :destroy
  has_many :users, :through => :activity_users

  STATUS_RUNNING = 0
  STATUS_END = 1
  STATUS_UN_START = 2
  STATUS = {STATUS_UN_START => "活动未开始", STATUS_RUNNING => "活动中", STATUS_END => "活动已结束"}

  def total_budgets_sum
  	sum = 0
  	budgets.each do |budget|
  		sum += budget.total_sum
  	end
  	return sum
  end

  def total_accounts_sum
  	sum = 0
  	accounts.each do |account|
  		sum += account.sum
  	end
  	return sum
  end

  def balance_sum
  	return total_budgets_sum - total_accounts_sum
  end
end
