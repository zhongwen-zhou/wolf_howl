#encoding: utf-8
class User < ActiveRecord::Base
  attr_accessible :access_token, :brief_introduction, :current_sign_in_at, :current_sign_in_ip, :email, :follower_count, :following_count, :group_count, :last_sign_in_at, :last_sign_in_ip, :nick_name, :password, :sign_in_count, :status, :token_updated_at, :permission, :password_confirmation, :is_remember, :images, :image
  validates :email, :nick_name, :password, :presence => { :message => "不能为空！"}
  validates :password, :confirmation => true
  validates :password_confirmation, :presence => true
  validates :email, :uniqueness => { :message => "该邮箱号码已注册，请重新输入！" }
  validates :nick_name, :uniqueness => { :message => "该昵称已注册，请重新输入！" }
  has_many :groups
  has_many :accounts, :as => :owner, :dependent => :destroy
  has_many :activities, :as => :owner, :dependent => :destroy
  has_many :budgets, :as => :owner, :dependent => :destroy
  has_many :images, :as => :imageable


  ADMIN_PERMISSION = 99

  GUEST_PERMISSION = -1

  def authorize_user
  	db_user = User.where(:email => self.email).first
  	return nil if db_user.nil? || db_user.password != self.password
  	return db_user if db_user.password == self.password
  end

  def join_group(group, invite = nil, is_admin = false, is_creater = false)
  	User.transaction do
  		group_user = GroupUser.create({:user_id => self.id, :group_id => group.id, :invitees_id => invite, :is_admin => is_admin, :is_creator => is_creater})
  		group.increment!(:member_count)
  	end
  end

  def join_activity(activity, invite = nil, is_admin = false)
    User.transaction do
      activity_user = ActivityUser.create({:user_id => self.id, :activity_id => activity.id, :invitees_id => invite, :is_admin => is_admin})
    end
  end

  def joind_activity?(activity)
    ActivityUser.where(:user_id => self.id, :activity_id => activity.id).first.present?
  end

  def quit_group(group)
    User.transaction do
      group_user = joined_group(group)
      group_user.destroy
      group.decrement!(:member_count)
    end
  end

  def sign_in(ip)
    self.last_sign_in_ip = self.current_sign_in_ip if self.current_sign_in_ip.present?
    self.last_sign_in_at = self.current_sign_in_at if self.current_sign_in_at.present?
    self.current_sign_in_ip = ip
    self.current_sign_in_at = Time.now
    self.increment(:sign_in_count)
    self.save
  end

  def self.create_init(params,ip)
    User.transaction do
      user = User.new(params)
      user.sign_in(ip)
      return user
    end
  end

  def self.guest_user
    User.where(:permission => GUEST_PERMISSION).first
  end

  def self.create_guest_user
    User.create({:email => "guest@wolf_howl.cn", :nick_name => "Guest", :password => "guest", :password_confirmation => "guest", :permission => GUEST_PERMISSION})
  end


  def is_guest_user?
    self.permission == GUEST_PERMISSION
  end

  def joined_group?(group)
    joined_group(group).present?
  end

  def joined_group(group)
    GroupUser.where(:user_id => self.id, :group_id => group.id).first
  end

  def create_activity(params)
    User.transaction do
      activity = self.activities.create(params.merge!({:user_id => self.id}))
      join_activity(activity,nil,true)
      return activity
    end
  end

  def create_budget(params, activity = nil, group = nil)
    if group.present?

    else
      params = params.merge({:genre => activity, :start_date => activity.start_date, :end_date => activity.end_date}) if activity.present?
      params = params.merge({:user_id => self.id})
      budget = self.budgets.create(params)
      return budget
    end
  end

  def create_account(params, activity = nil, group = nil)
    if group.present?
      params = params.merge({:genre => activity, :visable_status => activity.visable_status, :io_type => Account::IO_TYPE_OUTCOME}) if activity.present?
      params = params.merge({:user_id => self.id})
      account = group.accounts.create(params)
    else
      params = params.merge({:genre => activity, :visable_status => activity.visable_status, :io_type => Account::IO_TYPE_OUTCOME}) if activity.present?
      params = params.merge({:user_id => self.id})
      account = self.accounts.create(params)
    end
  end

  def create_group(params)
    User.transaction do
      group = self.groups.create(params)
      self.join_group(group,nil,true,true)
      return group
    end
  end

  def is_admin_group?(group)
    # return true if group.user_id == self.id
    joined_group(group).is_admin if joined_group(group).present?
  end

  def is_create_group?(group)
    return self.id == group.user_id
  end

  def remember_me
    User.transaction do
      self.update_attribute(:is_remember, true)
      self.update_attribute(:access_token, self.object_id.to_s)
      self.update_attribute(:token_updated_at, Time.now)
      self.save
    end
    return self.access_token
  end
  
  def canel_remember_me
    User.transaction do
      self.update_attribute(:is_remember, false)
      self.update_attribute(:access_token, self.object_id.to_s)
      self.update_attribute(:token_updated_at, Time.now)
      self.save
    end
    return self.access_token    
  end

  def is_admin?
    self.permission == ADMIN_PERMISSION
  end
end
