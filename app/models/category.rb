#encoding: utf-8
class Category < ActiveRecord::Base
  # paginates_per 5

  attr_accessible :description, :level, :name, :postion, :status, :user_id, :parent_id, :io_type
  belongs_to :user
  belongs_to :parent, :class_name => :Category, :foreign_key => :parent_id
  has_many :children, :class_name => :Category, :foreign_key => :parent_id
  validates :name, :presence => { :message => "不能为空！"}
  LEVEL_TOP = 0
  IO_TYPE_INCOME = 0
  IO_TYPE_OUTCOME = 1
  IO_TYPE = {IO_TYPE_INCOME => '收入', IO_TYPE_OUTCOME => '支出'}
  # LEVEL_ROOT = 0
  scope :top_categories, where(:level => LEVEL_TOP) 
  scope :income, where(:io_type => IO_TYPE_INCOME)
  scope :outcome, where(:io_type => IO_TYPE_OUTCOME)  
  # scope :root_categories, where(:level => LEVEL_ROOT)   


  def create_child(user,params)
  	params.delete(:parent_id)
  	category = self.children.build(params.merge!({:user_id => user.id}))
  	category.level = self.level + 1
  	self.max_postion = self.children.size + 1
  	self.save
  	return category
  end
end
