class User < ActiveRecord::Base
  attr_accessible :access_token, :brief_introduction, :current_sign_in_at, :current_sign_in_ip, :email, :follower_count, :following_count, :group_count, :last_sign_in_at, :last_sign_in_ip, :nick_name, :password, :sign_in_count, :status, :token_updated_at, :permission
  has_many :groups

  def authorize_user
  	db_user = User.where(:email => self.email).first
  	return nil if db_user.nil? || db_user.password != self.password
  	return db_user if db_user.password == self.password
  end
end
