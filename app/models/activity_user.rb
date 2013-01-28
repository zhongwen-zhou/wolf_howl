class ActivityUser < ActiveRecord::Base
  attr_accessible :activity_id, :invitees_id, :is_admin, :status, :user_id
  belongs_to :user
  belongs_to :activity
end
