class Image < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  attr_accessible :content_type, :file_name, :file_size, :imageable_id, :imageable_type, :state, :user_id
  belongs_to :imageable, :polymorphic => true
end
