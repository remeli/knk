class Category < ActiveRecord::Base
  
  has_many :products, :dependent => :destroy
  
  default_scope order("created_at ASC")
  scope :recent, limit(5)
  
  validates :name, :presence => { :message => "Название обязательно" }
end
