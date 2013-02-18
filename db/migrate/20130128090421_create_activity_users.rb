class CreateActivityUsers < ActiveRecord::Migration
  def change
    create_table :activity_users do |t|
      t.integer :activity_id, :null => false
      t.integer :user_id, :null => false
      t.integer :invitees_id
      t.boolean :is_admin, :default => false
      t.integer :status, :null => false, :default => 0
      t.float :last_paid_account
      t.float :last_total_account
      t.datetime :last_joined_time
      t.datetime :last_left_time

      t.timestamps
    end
  end
end
