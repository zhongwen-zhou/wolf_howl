class CreateGroupUsers < ActiveRecord::Migration
  def change
    create_table :group_users do |t|
      t.integer :group_id
      t.integer :user_id
      t.integer :invitees_id
      t.boolean :is_follow, :default => false
      t.boolean :is_admin, :default => false

      t.timestamps
    end
  end
end
