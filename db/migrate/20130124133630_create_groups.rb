class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.integer :level, :default => 1
      t.integer :status, :default => 0
      t.integer :following_count, :default =>0
      t.integer :member_count, :default => 0
      t.integer :user_id
      t.integer :visable_status, :null => false, :default => 0

      t.timestamps
    end
  end
end
