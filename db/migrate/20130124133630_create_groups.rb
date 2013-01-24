class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.text :description
      t.integer :level
      t.integer :status
      t.integer :following_count
      t.integer :member_count
      t.integer :user_id

      t.timestamps
    end
  end
end
