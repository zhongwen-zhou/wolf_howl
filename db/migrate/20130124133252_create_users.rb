class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :nick_name
      t.string :password
      t.text :brief_introduction
      t.integer :status
      t.string :access_token
      t.datetime :token_updated_at
      t.integer :following_count
      t.integer :follower_count
      t.integer :group_count
      t.integer :sign_in_count
      t.datetime :current_sign_in_at
      t.string :current_sign_in_ip
      t.datetime :last_sign_in_at
      t.string :last_sign_in_ip
      t.integer :permission

      t.timestamps
    end
  end
end
