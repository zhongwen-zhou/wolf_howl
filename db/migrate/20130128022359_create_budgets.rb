class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.string :name, :null => false
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.integer :visable_status
      t.integer :status, :null => false, :default => 0
      t.float :total_sum
      t.float :balance_sum
      t.integer :genre_id
      t.string :genre_type
      t.integer :owner_id
      t.string :owner_type
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
