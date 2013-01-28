class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :level, :default => 0
      t.integer :status, :default => 0
      t.integer :postion, :default => 0
      t.integer :parent_id
      t.integer :user_id

      t.timestamps
    end
  end
end
