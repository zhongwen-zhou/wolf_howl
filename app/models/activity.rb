#encoding: utf-8
class Activity < ActiveRecord::Base
  attr_accessible :address, :description, :end_date, :start_date, :status, :subject, :owner_id, :owner_type, :user_id
  validates  :subject, :presence => { :message => "不能为空！"}
  belongs_to :owner, :polymorphic => :true
  belongs_to :user
  has_many :accounts, :as => :owner, :dependent => :destroy
  has_many :activity_users, :dependent => :destroy
  has_many :users, :through => :activity_users
end
