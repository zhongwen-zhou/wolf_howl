class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :null => false
      t.string :nick_name, :null => false
      t.string :password, :null => false
      t.text :brief_introduction
      t.integer :status, :default => 0, :null => false
      t.string :access_token
      t.datetime :token_updated_at
      t.integer :following_count, :default => 0
      t.integer :follower_count, :default => 0
      t.integer :group_count, :default => 0
      t.integer :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.string :current_sign_in_ip
      t.datetime :last_sign_in_at
      t.string :last_sign_in_ip
      t.integer :permission, :default => 1, :null => false
      t.boolean :is_remember, :default => false

      t.timestamps
    end
  end
end
