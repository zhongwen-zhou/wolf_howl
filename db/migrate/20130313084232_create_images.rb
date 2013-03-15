class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file_name
      t.string :content_type
      t.string :file_size
      t.string :imageable_type
      t.integer :imageable_id
      t.integer :user_id
      t.integer :state

      t.timestamps
    end
  end
end
