class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.float :sum, :null => false
      t.integer :io_type
      t.string :owner_type
      t.integer :owner_id
      t.string :genre_type
      t.integer :genre_id
      t.text :remark
      t.integer :visable_status, :null => false, :default => 0
      t.integer :user_id, :null => false

      t.timestamps
    end
  end
end
