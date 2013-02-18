#encoding: utf-8
class Activity < ActiveRecord::Base
  attr_accessible :address, :description, :end_date, :start_date, :status, :subject, :owner_id, :owner_type, :user_id, :visable_status
  validates  :subject, :presence => { :message => "不能为空！"}
  belongs_to :owner, :polymorphic => :true
  belongs_to :user
  has_many :accounts, :as => :genre, :dependent => :destroy
  has_many :budgets, :as => :genre, :dependent => :destroy
  has_many :activity_users, :dependent => :destroy
  has_many :users, :through => :activity_users

  STATUS_RUNNING = 0
  STATUS_END = 1
  STATUS_UN_START = 2
  STATUS = {STATUS_UN_START => "活动未开始", STATUS_RUNNING => "活动中", STATUS_END => "活动已结束"}

  VISABLE_STATUS_PUBLIC = 0
  VISABLE_STATUS_FRIENDLY = 1
  VISABLE_STATUS_GROUP = 2
  VISABLE_STATUS_PRIVATE = 3

  VISABLE_STATUS = {VISABLE_STATUS_PUBLIC => '公开的', VISABLE_STATUS_FRIENDLY => '仅朋友可见', VISABLE_STATUS_GROUP => '小组可见', VISABLE_STATUS_PRIVATE => '私人的'}

  paginates_per 1

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

  def check_update_status
    self.update_attribute(:status,check_status)
  end

  def running?
    self.status == STATUS_RUNNING
  end

  def end?
    self.status == STATUS_END
  end

  def un_start?
    self.status == STATUS_UN_START
  end

  def personal_outcome_account(user)
    if self.owner_type == 'User'
      total_accounts_sum
    elsif self.owner_type == 'Group'
      total_accounts_sum/owner.users.size
    end
  end

  def personal_outcome_total_account(user)
    if self.owner_type == 'User'
      total_accounts_sum
    elsif self.owner_type == 'Group'
      paid_sum = 0
      self.accounts.where(:paid_user_id => user.id).each {|a| paid_sum += a.sum }
      paid_sum
    end
  end  

  def personal_outcome_should_account(user)
    personal_outcome_account(user) - personal_outcome_total_account(user)
  end

  private
  def check_status
    return STATUS_UN_START if Time.now < self.start_date
    return STATUS_END if Time.now > self.end_date
    return STATUS_RUNNING
  end
end
