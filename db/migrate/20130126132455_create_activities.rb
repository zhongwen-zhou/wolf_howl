class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :subject, :null => false
      t.text :description
      t.string :address
      t.integer :status, :null => false, :default => 0
      t.datetime :start_date
      t.datetime :end_date
      t.integer :owner_id
      t.string :owner_type
      t.integer :visable_status, :null => false, :default => 0
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
