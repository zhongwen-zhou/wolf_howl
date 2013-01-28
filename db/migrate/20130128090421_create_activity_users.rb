class CreateActivityUsers < ActiveRecord::Migration
  def change
    create_table :activity_users do |t|
      t.integer :activity_id, :null => false
      t.integer :user_id, :null => false
      t.integer :invitees_id
      t.boolean :is_admin
      t.integer :status, :null => false, :default => 0

      t.timestamps
    end
  end
end
