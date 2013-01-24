class User < ActiveRecord::Base
  attr_accessible :access_token, :brief_introduction, :current_sign_in_at, :current_sign_in_ip, :email, :follower_count, :following_count, :group_count, :last_sign_in_at, :last_sign_in_ip, :nick_name, :password, :sign_in_count, :status, :token_updated_at
end
