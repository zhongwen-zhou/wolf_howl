class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name, :null => false
      t.text :description
      t.integer :level, :default => 0
      t.integer :status, :null => false, :default => 0
      t.integer :postion, :default => 0
      t.integer :max_postion
      t.integer :parent_id
      t.integer :user_id, :null => false
      t.integer :io_type, :null => false, :default => 0

      t.timestamps
    end
  end
end
