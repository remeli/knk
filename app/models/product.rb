class Product < ActiveRecord::Base
  
  # associations:
  belongs_to :category
  
  # scopes:
  default_scope order("id DESC")
  scope :published, where(:published => true)
  scope :unpublished, where(:published => false)
  scope :all_products, where(true)
  scope :recent, limit(10)  
  # validates:
  validates :name, :presence => { :message => "Название обязательно" }
  validates :category_id, :presence => { :message => "Рубрика обязательна" }
end
