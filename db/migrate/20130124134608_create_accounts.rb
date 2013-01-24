class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.float :sum
      t.integer :io_type
      t.string :owner_type
      t.integer :owner_id
      t.string :budget_type
      t.integer :budget_id
      t.text :remark

      t.timestamps
    end
  end
end
