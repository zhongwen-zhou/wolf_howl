#encoding: utf-8
class Account < ActiveRecord::Base
  attr_accessible :budget_id, :budget_type, :io_type, :owner_id, :owner_type, :remark, :sum, :visable_status, :genre, :user_id, :genre_id, :genre_type
  paginates_per 11
  belongs_to :owner, :polymorphic => :true
  belongs_to :genre, :polymorphic => :true
  # belongs_to :activity
  validates :sum, :presence => { :message => "金额不能为空！"}
  IO_TYPE_INCOME = 0
  IO_TYPE_OUTCOME = 1

  IO_TYPE = {IO_TYPE_INCOME => '收入', IO_TYPE_OUTCOME => '支出'}

  STATISTICS = {:io_type => {:io_income => 0, :io_outcome => 1}}

  scope :income, where(:io_type => IO_TYPE_INCOME)
  scope :outcome, where(:io_type => IO_TYPE_OUTCOME)

  def self.statistics(user,type,value,start_date,end_date)
  	if type == :io_type
  		accounts = user.accounts.where(:created_at => start_date..end_date, :io_type => value).map(&:sum)
  	elsif type == :category_type
  		category = Category.find(value)
  		categories_ids = category.children.map(&:id)
  		accounts = user.accounts.where(:created_at => start_date..end_date,:genre_type => 'Category', :genre_id => categories_ids).map(&:sum)
  	end
  end

  def genre_type_detail
    if genre_type == 'Activity'
      "活动/#{genre.subject}"      
    elsif genre_type == 'Category'
      genre.name
    end
        
  end
end
