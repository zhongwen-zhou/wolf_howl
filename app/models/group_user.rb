#encoding: utf-8
class GroupUser < ActiveRecord::Base
  attr_accessible :group_id, :invitees_id, :is_admin, :user_id
  belongs_to :group
  belongs_to :user
end
