class Category < ActiveRecord::Base
  
  acts_as_tree :order => "name"
  
  has_many :products, :dependent => :destroy
  
  default_scope order("created_at ASC")
  scope :recent, limit(5)
  scope :childrens, where("parent_id IS NOT NULL")
  scope :mains, where("parent_id IS NULL")
  validates :name, :presence => { :message => "Название обязательно" }
  
end
