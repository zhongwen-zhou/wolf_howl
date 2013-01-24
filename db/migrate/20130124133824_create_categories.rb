class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.integer :level
      t.integer :status
      t.integer :postion
      t.integer :parent_id
      t.integer :user_id

      t.timestamps
    end
  end
end
